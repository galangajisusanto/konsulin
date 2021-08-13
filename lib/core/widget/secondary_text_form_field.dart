import 'package:flutter/material.dart';

class SecondaryTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Color hintTextColor;
  final Color focusBorderColor;
  final Color defaultBorderColor;
  final Color cursorColor;
  final Color textColor;
  final Widget suffix;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final double contentPadding;
  final double borderRadius;
  final TextStyle style;
  final TextAlign textAlign;

  const SecondaryTextFormField({
    required Key key,
    this.obscureText = false,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.hintTextColor = Colors.black45,
    this.focusBorderColor = Colors.black,
    this.defaultBorderColor = Colors.black45,
    this.cursorColor = Colors.black,
    this.textColor = Colors.black,
    required this.suffix,
    required this.validator,
    required this.controller,
    this.contentPadding = 6,
    this.borderRadius = 4,
    required this.style,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(
            contentPadding, contentPadding, contentPadding, contentPadding),
        isDense: true,
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintTextColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: defaultBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: focusBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        suffix: suffix,
      ),
      validator: validator,
      cursorColor: cursorColor,
      style: style,
      textAlign: textAlign,
    );
  }
}
