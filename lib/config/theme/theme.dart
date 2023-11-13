import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/localfiles.dart';

class AppStyle {
  // Couleurs
  static final Color kDefaultColor = Color(0xFF5271FF);
  static final Color kSecondaryColor = Color(0xFF97A6BF);
  static final Color kWhite = Colors.white;

  static final Color kTransparent = Colors.transparent;
  static final Color kBlack = Color(0xFF262626);
  static final Color kGreyColor = Color(0xFF6C757D);
  static final Color kgreyToWhite = Color(0xFFF6F7FA);
  static final Color defaultIconColor = kBlack;
  static final Color kRedColor = Color(0xFFFF5757);

  static final EdgeInsets cardPadding = EdgeInsets.all(defaultSpacing);

  // Text Styles
  static final TextStyle kBlackTextStyle = TextStyle(
    color: kBlack,
  );

  static final TextStyle kBoldTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle kItalicBlueTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: kDefaultColor,
  );

  static final TextStyle appbarTextStyle = const TextStyle(
    fontSize: fontsize_20,
    fontWeight: fontWeight_500,
  ).merge(kBlackTextStyle);

  static TextStyle btnTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: fontsize_20,
      fontWeight: fontWeight_400,
    );
  }

  static final TextStyle footerAuthMessage = TextStyle(
    decoration: TextDecoration.underline,
  ).merge(kBoldTextStyle).merge(kItalicBlueTextStyle);

  static TextStyle studentContainerTextStyle(Color color , double fontSize) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight_500,
    );
  }

   static TextStyle AppbarTextStyle(Color color , double fontSize) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight_500,
      letterSpacing: 1
      
    );
  }
   static TextStyle secondTextSpanStyle() {
    return const TextStyle(
      fontSize: fontsize_15,
      fontWeight: FontWeight.bold,
    ).merge(kBlackTextStyle);
  }
}
