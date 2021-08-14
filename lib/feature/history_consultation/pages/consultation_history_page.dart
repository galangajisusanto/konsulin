import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/consultation_history_card.dart';
import 'package:hackathon_app/feature/history_consultation/stores/history_consultation_data.dart';

class ConsultationHistoryPage extends StatefulWidget {
  @override
  _ConsultationHistoryPageState createState() =>
      _ConsultationHistoryPageState();
}

class _ConsultationHistoryPageState extends State<ConsultationHistoryPage> {
  final _consultationHistoryData = ConsultationHistoryData();

  @override
  void initState() {
    super.initState();
    _consultationHistoryData.getConsultationHistories();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Riwayat Konsultasi',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => _consultationHistoryData.isLoadingHistory
              ? SpinKitRing(
                  color: Style.primaryColor,
                  size: 50.0,
                )
              : ListView.builder(
                  itemCount:
                      _consultationHistoryData.consultationHistories.length,
                  itemBuilder: (context, index) {
                    return ConsultationHistoryCard(
                      history:
                      _consultationHistoryData.consultationHistories[index],
                      onPressed: () {
                        print('card clicked');
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
