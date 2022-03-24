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
        imageUrl: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        dateTime: '3 hari yang lalu',
      ),
      ConsultationHistory(
        name: 'Ginanjar Ramadhan',
        expertise: '#SosialMedia #SEO #Copywriting #FacebookAds ',
        imageUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
        dateTime: '3 hari yang lalu',
      ),
      ConsultationHistory(
        name: 'Firna Helfira',
        expertise: '#Marketplace',
        imageUrl: 'https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80',
        dateTime: '3 hari yang lalu',
      ),
    ];
    consultationHistories.addAll(allHistory);

    Timer(Duration(seconds: 1), () {
      isLoadingHistory = false;
    });
  }
}
