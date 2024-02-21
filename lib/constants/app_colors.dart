import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color transparentColor = Colors.transparent;
  static const Color primaryColor = Color(0XFF4960F9);
  static const Color secondPrimaryColor = Color(0XFFF88B3E);
  static const Color redColor = Colors.red;
  static const Color lightGreenColor = Color(0XFF00C297);
  static const Color lightRedColor = Color(0XFFFF866E);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color blackColor = Colors.black;
  static const Color blueColor = Colors.blue;
  static const Color k9B9BA3 = Color(0XFF9B9BA3);

}


String emailValidationRegExp =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String passwordValidationRegExp =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*\d)(?=.*[@$!%*?&_+*#^/]).{6,}$';
String nameValidationRegExp = r'^[a-zA-Z ]+$';
