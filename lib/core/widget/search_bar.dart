import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;

  const SearchBar({Key? key, required this.onChange, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.lightGrayColor2,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: EdgeInsets.only(left: 16.0),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: 'Cari Konsultan dengan Nama atau Topik',
          border: InputBorder.none,
          hintStyle: Style.subTitle2.copyWith(
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: IconButton(
            splashRadius: 24.0,
            icon: Icon(Icons.arrow_back, color: Style.grayColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        style: const TextStyle(color: Colors.black87, fontSize: 16.0),
      ),
    );
  }
}
