import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';

class HeaderOfSection extends StatelessWidget {
  final String title;
  final String subTitle;

  const HeaderOfSection({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Style.subTitle1,
      ),
      subtitle: Text(
        subTitle,
        style: Style.subTitle2
            .apply(color: Style.black.withOpacity(0.6))
            .copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}
