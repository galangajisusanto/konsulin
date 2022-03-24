import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hackathon_app/core/utils/style.dart';

class ConsultationChatPage extends StatefulWidget {
  @override
  _ConsultationChatPageState createState() => _ConsultationChatPageState();
}

class _ConsultationChatPageState extends State<ConsultationChatPage> {
  InAppWebViewController? webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Style.grayColor,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://widget.chataja.co.id/?key=abe30eeb0995d2d051d5694d01fb29e8ed5876f5")),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform:
                InAppWebViewOptions(useShouldOverrideUrlLoading: true),
            ios: IOSInAppWebViewOptions(),
            android: AndroidInAppWebViewOptions(),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onLoadStart: (controller, url) {
            setState(() {
              this.url = url?.toString() ?? '';
            });
          },
          onLoadStop: (controller, url) async {
            setState(() {
              this.url = url?.toString() ?? '';
            });
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
      ),
    );
  }
}
