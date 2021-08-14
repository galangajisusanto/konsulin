import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/consultant_card.dart';
import 'package:hackathon_app/core/widget/search_bar.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class ConsultantSearchPage extends StatefulWidget {
  @override
  _ConsultantSearchPageState createState() => _ConsultantSearchPageState();
}

class _ConsultantSearchPageState extends State<ConsultantSearchPage> {
  final _consultantData = ConsultantData();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _consultantData.getConsultantRecommendation();
  }

  void _searchBarListener(String name) {
    _consultantData.searchConsultantByNameTopic(nameTopic: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBar(
          onChange: _searchBarListener,
          controller: _controller,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
        automaticallyImplyLeading: false,
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
                        print('chat clicked');
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
