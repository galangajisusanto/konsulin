import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';
import 'package:hackathon_app/feature/consultation/model/consultant.dart';
import 'package:hackathon_app/feature/consultation/pages/consultant_detail_page.dart';

class ConsultantCard extends StatelessWidget {
  const ConsultantCard({
    Key? key,
    required Consultant consultant,
    required void Function() chatPressed,
  })  : _consultant = consultant,
        _chatPressed = chatPressed,
        super(key: key);

  final Consultant _consultant;
  final void Function() _chatPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConsultantDetailPage(
                consultant: _consultant,
              ),
            ),
          );
        },
        child: Card(
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: 10.0,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://anjardhan.com/storage/app/' +
                        _consultant.imageUrl),
              ),
              title: Text(
                _consultant.name,
                style: Style.subTitle2,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    _consultant.profession,
                    style: Style.caption,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    height: 30,
                    child: Text(
                      _consultant.expertise,
                      style: Style.caption.apply(color: Style.secondaryColor),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: _chatPressed,
                  icon: Icon(
                    Icons.chat,
                    size: 24,
                    color: Style.primaryColor,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
