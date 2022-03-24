import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/consultant_card.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_chat_page.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

import 'inapp_web_browser.dart';

class ConsultantRecommendationPage extends StatefulWidget {
  @override
  _ConsultantRecommendationPageState createState() =>
      _ConsultantRecommendationPageState();
}

class _ConsultantRecommendationPageState
    extends State<ConsultantRecommendationPage> {
  final _consultantData = ConsultantData();

  @override
  void initState() {
    super.initState();
    _consultantData.getConsultantRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Rekomendasi Konsultan',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => _consultantData.isLoadingConsultantRecommendation
              ? SpinKitRing(
                  color: Style.primaryColor,
                  size: 50.0,
                )
              : ListView.builder(
                  itemCount: _consultantData.consultantRecommendation.length,
                  itemBuilder: (context, index) {
                    return ConsultantCard(
                      consultant:
                          _consultantData.consultantRecommendation[index],
                      chatPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsultationChatPage()),
                        );
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
