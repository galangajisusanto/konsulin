import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class TopicDialog extends StatefulWidget {
  final ConsultantData consultantData;

  const TopicDialog({Key? key, required this.consultantData}) : super(key: key);

  @override
  _TopicDialogState createState() => _TopicDialogState();
}

class _TopicDialogState extends State<TopicDialog> {
  late Topic? _selectedTopic;

  @override
  void initState() {
    super.initState();
    _selectedTopic = widget.consultantData.selectedTopic;
  }

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
      ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24.0),
            child: Text(
              "Topik",
              style: Style.headline6.copyWith(fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
          Observer(
            builder: (_) => Expanded(
              child: ListView.builder(
                  itemCount: widget.consultantData.topics.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<Topic>(
                      value: widget.consultantData.topics[index],
                      groupValue: _selectedTopic,
                      title: Text(
                        widget.consultantData.topics[index].name,
                        style: Style.subTitle2.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      onChanged: (topic) {
                        setState(() {
                          _selectedTopic = topic;
                        });
                      },
                    );
                  }),
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: Style.lightGrayColor2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: Style.subTitle1.apply(
                      color: Style.secondaryColor,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(_selectedTopic);
                  },
                  child: Text(
                    'OK',
                    style: Style.subTitle1.apply(
                      color: Style.secondaryColor,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
