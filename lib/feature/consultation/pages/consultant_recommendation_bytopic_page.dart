import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/consultant_card.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class ConsultantRecommendationByTopicPage extends StatefulWidget {
  final Topic topic;

  const ConsultantRecommendationByTopicPage({Key? key, required this.topic})
      : super(key: key);

  @override
  _ConsultantRecommendationByTopicPageState createState() =>
      _ConsultantRecommendationByTopicPageState();
}

class _ConsultantRecommendationByTopicPageState
    extends State<ConsultantRecommendationByTopicPage> {
  final _consultantData = ConsultantData();

  @override
  void initState() {
    super.initState();
    _consultantData.getConsultantRecommendationByTopic(topic: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.topic.name,
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
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.topic.description,
                        style: Style.subTitle2
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 10,
                      color: Style.lightGrayColor2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Rekomendasi Konsultan',
                        style: Style.subTitle1,
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount:
                            _consultantData.consultantRecommendation.length,
                        itemBuilder: (context, index) {
                          return ConsultantCard(
                            consultant:
                                _consultantData.consultantRecommendation[index],
                            chatPressed: () {
                              print('chat clicked');
                            },
                          );
                        }),
                  ],
                ),
        ),
      ),
    );
  }
}
