import 'package:flutter/material.dart';

class ConsultationHistoryPage extends StatefulWidget {
  @override
  _ConsultationHistoryPageState createState() =>
      _ConsultationHistoryPageState();
}

class _ConsultationHistoryPageState extends State<ConsultationHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(
            'Konsultasi history',
          ),
        ),
      ),
    );
  }
}
