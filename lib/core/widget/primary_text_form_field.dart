import 'package:flutter/material.dart';
import 'package:hackathon_app/core/utils/style.dart';

class PrimaryTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Color hintTextColor;
  final Color focusBorderColor;
  final Color defaultBorderColor;
  final Color cursorColor;
  final Color textColor;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;

  const PrimaryTextFormField({
    Key? key,
    this.obscureText = false,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.hintTextColor = Colors.black45,
    this.focusBorderColor = Colors.black,
    this.defaultBorderColor = Colors.black45,
    this.cursorColor = Colors.black,
    this.textColor = Colors.black,
    this.suffix,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        contentPadding: EdgeInsets.fromLTRB(0, 6, 6, 6),
        isDense: true,
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintTextColor,
        ),
        labelStyle: TextStyle(
          fontSize: 12,
          color: hintTextColor,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: defaultBorderColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusBorderColor,
          ),
        ),
        suffix: suffix,
      ),
      validator: validator,
      cursorColor: cursorColor,
      style: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
    );
  }
}
