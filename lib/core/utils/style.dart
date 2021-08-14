import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  static final primaryColor = HexColor('#246EE9');
  static final secondaryColor = HexColor('#6E9CFF');
  static final grayColor = HexColor('#707070');
  static final lightGrayColor1 = HexColor('#B1B1B1');
  static final lightGrayColor2 = HexColor('#F6F6F6');
  static final black = HexColor('#262626');

  static final caption =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: grayColor);
  static final subTitle1 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: black);
  static final subTitle2 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: black);
  static final headline6 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: black);
}
