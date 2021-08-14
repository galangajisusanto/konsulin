import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';

class ProfileMenu extends StatelessWidget {
  final Icon leading;
  final String title;
  final void Function() onPressed;

  const ProfileMenu({
    Key? key,
    required this.leading,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          ListTile(
            leading: leading,
            trailing: Icon(
              Icons.chevron_right,
              color: Style.grayColor,
            ),
            title: Text(
              title,
              style: Style.subTitle2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
          )
        ],
      ),
    );
  }
}
