import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';

class AboutAppPage extends StatefulWidget {
  @override
  _AboutAppPageState createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tentang Aplikasi',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Aplikasi yang membantu kamu untuk menscale-up bisnis kamu.',
                style: Style.subTitle2
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 15.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
