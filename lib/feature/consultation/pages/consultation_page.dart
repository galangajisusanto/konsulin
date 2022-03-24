import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/consultant_card.dart';
import 'package:hackathon_app/core/widget/header_of_section.dart';
import 'package:hackathon_app/core/widget/primary_button.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/pages/consultant_recommendation_bytopic_page.dart';
import 'package:hackathon_app/feature/consultation/pages/consultant_recommendation_page.dart';
import 'package:hackathon_app/feature/consultation/pages/consultant_search_page.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_chat_page.dart';
import 'package:hackathon_app/feature/consultation/pages/greeting_dialog.dart';
import 'package:hackathon_app/feature/consultation/pages/topic_dialog.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';
import 'package:hackathon_app/feature/history_consultation/pages/consultation_history_page.dart';

import 'inapp_web_browser.dart';

class ConsultationPage extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  final _consultantData = ConsultantData();

  List<String> topics = [''];

  @override
  void initState() {
    super.initState();
    _consultantData.getConsultantRecommendation(limit: 3);

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => GreetingDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Konsulin',
          style: Style.headline6.apply(color: Style.primaryColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.history,
              color: Style.grayColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConsultationHistoryPage()),
              );
            },
            splashRadius: 24,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConsultantSearchPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Style.lightGrayColor2,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search_rounded,
                      color: Style.grayColor,
                    ),
                    title: Text(
                      'Cari Konsultan dengan Nama atau Topik',
                      style: Style.subTitle2
                          .apply(color: Style.grayColor)
                          .copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 10,
              color: Style.lightGrayColor2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HeaderOfSection(
                    title: 'Rekomendasi Konsultan',
                    subTitle: 'Konsultan yang cocok dengan topik Anda',
                  ),
                  Observer(
                    builder: (_) => _consultantData
                            .isLoadingConsultantRecommendation
                        ? SpinKitRing(
                            color: Style.primaryColor,
                            size: 50.0,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount:
                                _consultantData.consultantRecommendation.length,
                            itemBuilder: (context, index) {
                              return ConsultantCard(
                                consultant: _consultantData
                                    .consultantRecommendation[index],
                                chatPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultationChatPage(),
                                    ),
                                  );

                                  print('chat clicked');
                                },
                              );
                            }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConsultantRecommendationPage()),
                          );
                        },
                        child: Text(
                          'Lihat selengkapnya >>',
                          style: Style.subTitle1.apply(
                            color: Style.primaryColor,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Style.lightGrayColor2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  HeaderOfSection(
                    title: 'Topik Konsultasi',
                    subTitle: 'Pilih topik, untuk memulai konsultasi',
                  ),
                  InkWell(
                    onTap: () async {
                      Topic? topic = await showDialog(
                        context: context,
                        builder: (BuildContext context) => TopicDialog(
                          consultantData: _consultantData,
                        ),
                      );
                      if (topic != null) _consultantData.selectedTopic = topic;
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Style.lightGrayColor2,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        trailing: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.chevron_right,
                            color: Style.grayColor,
                          ),
                        ),
                        title: Observer(
                          builder: (_) => Text(
                            _consultantData.selectedTopic == null
                                ? 'Topik'
                                : _consultantData.selectedTopic!.name,
                            style: Style.subTitle2
                                .apply(color: Style.grayColor)
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SizedBox(
                      width: 114,
                      child: Observer(
                        builder: (_) => PrimaryButton(
                          title: 'Cari',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ConsultantRecommendationByTopicPage(
                                  topic: _consultantData.selectedTopic!,
                                ),
                              ),
                            );
                          },
                          enableBackgroundColor: Style.primaryColor,
                          enableTitleColor: Colors.white,
                          disableBackgroundColor: Style.secondaryColor,
                          disableTitleColor: Colors.white,
                          isEnable: _consultantData.selectedTopic != null,
                          disableBorderColor: Style.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
