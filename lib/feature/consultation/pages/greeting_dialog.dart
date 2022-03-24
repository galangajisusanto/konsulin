import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/core/widget/primary_button.dart';
import 'package:hackathon_app/feature/profile/pages/topic_page.dart';

import 'consultant_recommendation_bytopic_page.dart';

class GreetingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 24,
        bottom: 28.0,
        left: 24.0,
        right: 24.0,
      ),
      margin: EdgeInsets.only(top: 66.0),
      decoration: BoxDecoration(
        color: Colors.white, //Colors.black.withOpacity(0.3),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(
            "Selamat datang di \nKonsulin!",
            style: Style.headline6,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          Text(
            "Pilih topik yang ada, kami akan merekomendasikan konsultan yang cocok dengan Anda",
            textAlign: TextAlign.center,
            style: Style.subTitle2.copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 24.0),
          SizedBox(
            width: 114,
            child: PrimaryButton(
              title: 'Pilih Topik',
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopicPage()),
                );
                Navigator.of(context).pop();
              },
              enableBackgroundColor: Style.primaryColor,
              enableTitleColor: Colors.white,
              isEnable: true,
            ),
          ),
          SizedBox(
            width: 114.0,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Nanti dulu',
                  style: Style.subTitle1.apply(
                    color: Style.secondaryColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
