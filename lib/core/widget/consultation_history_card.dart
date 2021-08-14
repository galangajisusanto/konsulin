import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/history_consultation/model/history_consultation.dart';

class ConsultationHistoryCard extends StatelessWidget {
  const ConsultationHistoryCard({
    Key? key,
    required ConsultationHistory history,
    required void Function() onPressed,
  })  : _history = history,
        _onPressed = onPressed,
        super(key: key);

  final ConsultationHistory _history;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80'),
          ),
          title: Text(
            _history.name,
            style: Style.subTitle2,
          ),
          subtitle: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          height: 30,
                          child: Text(
                            _history.expertise,
                            style: Style.caption
                                .apply(color: Style.secondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      _history.dateTime,
                      style: Style.caption,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
