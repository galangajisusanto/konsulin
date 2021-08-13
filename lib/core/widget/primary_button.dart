import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isEnable;
  final void Function() onPressed;
  final String title;
  final Color enableBackgroundColor;
  final Color disableBackgroundColor;
  final Color enableSplashColor;
  final Color disableBorderColor;
  final Color enableTitleColor;
  final Color disableTitleColor;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isEnable = true,
    this.enableBackgroundColor = Colors.black,
    this.disableBackgroundColor = Colors.white,
    this.enableSplashColor = Colors.white,
    this.disableBorderColor = Colors.black45,
    this.enableTitleColor = Colors.white,
    this.disableTitleColor = Colors.black45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnable ? onPressed : null,
      style: isEnable
          ? OutlinedButton.styleFrom(
              primary: enableSplashColor,
              backgroundColor: enableBackgroundColor,
              padding: EdgeInsets.all(16),
              side: BorderSide(
                width: 1.0,
                color: enableBackgroundColor,
              ),
            )
          : OutlinedButton.styleFrom(
              primary: disableBackgroundColor,
              backgroundColor: disableBackgroundColor,
              padding: EdgeInsets.all(16),
              side: BorderSide(
                width: 1.0,
                color: disableBorderColor,
              ),
            ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: isEnable ? enableTitleColor : disableTitleColor,
        ),
      ),
    );
  }
}
