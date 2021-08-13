import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_chat_page.dart';
import 'package:hackathon_app/feature/consultation/pages/consultation_history_page.dart';

import 'inapp_web_browser.dart';

class ConsultationPage extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Hallo Apps!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Style.primaryColor,
          ),
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
        child: Container(
          child: Center(
            child: OutlinedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ConsultationChatPage(),
                //   ),
                // );

                widget.browser.openUrlRequest(
                    urlRequest: URLRequest(
                        url: Uri.parse(
                            "https://widget.chataja.co.id/?key=abe30eeb0995d2d051d5694d01fb29e8ed5876f5")),
                    options: InAppBrowserClassOptions(
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      useOnLoadResource: true,
                    ))));
              },
              child: Text(
                'konsultasi',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
