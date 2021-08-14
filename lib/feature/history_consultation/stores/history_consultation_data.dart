import 'dart:async';

import 'package:hackathon_app/feature/history_consultation/model/history_consultation.dart';
import 'package:mobx/mobx.dart';

part 'history_consultation_data.g.dart';

class ConsultationHistoryData = ConsultationHistoryBase
    with _$ConsultationHistoryData;

abstract class ConsultationHistoryBase with Store {
  @observable
  List<ConsultationHistory> consultationHistories = [];

  @observable
  bool isLoadingHistory = false;

  @action
  void getConsultationHistories() {
    isLoadingHistory = true;

    var allHistory = [
      ConsultationHistory(
        name: 'Galang Aji Susanto',
        expertise: '#BusinessAnalyst',
        imageUrl: '',
        dateTime: '3 hari yang lalu',
      ),
      ConsultationHistory(
        name: 'Ginanjar Ramadhan',
        expertise: '#SosialMedia #SEO #Copywriting #FacebookAds ',
        imageUrl: '',
        dateTime: '3 hari yang lalu',
      ),
      ConsultationHistory(
        name: 'Firna Helfira',
        expertise: '#Marketplace',
        imageUrl: '',
        dateTime: '3 hari yang lalu',
      ),
    ];
    consultationHistories.addAll(allHistory);

    Timer(Duration(seconds: 1), () {
      isLoadingHistory = false;
    });
  }
}
