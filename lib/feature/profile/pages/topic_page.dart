import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/consultation/model/Topic.dart';
import 'package:hackathon_app/feature/consultation/stores/consultant_data.dart';

class TopicPage extends StatefulWidget {
  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  ConsultantData _consultantData = ConsultantData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Topik',
          style: Style.headline6,
        ),
        iconTheme: IconThemeData(
          color: Style.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: Style.headline6.copyWith(
                fontWeight: FontWeight.normal,
                color: Style.secondaryColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => Container(
            padding: EdgeInsets.all(5.0),
            child: Wrap(
              children: [
                for (Topic topic in _consultantData.topics)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FilterChip(
                      checkmarkColor: Colors.white,
                      label: Text(
                        topic.name,
                        style: topic.isSelected!
                            ? TextStyle(fontSize: 15, color: Colors.white)
                            : TextStyle(
                                fontSize: 15,
                                color: Style.black,
                              ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      selected: topic.isSelected ?? false,
                      selectedColor: Style.secondaryColor,
                      disabledColor: Style.lightGrayColor1,
                      onSelected: (bool selected) {
                        setState(() {
                          topic.isSelected = selected;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
