import 'package:flutter/material.dart';
import '../utils/constant.dart';

class AppStyle {
  // Couleurs
  static const Color kDefaultColor = Color(0xFF5271FF);
  
  static const Color kSecondaryColor = Color(0xFF97A6BF);
  static const Color kWhite = Colors.white;
  static const Color kGreen = Color(0xFF54CA69);

  static const Color kTransparent = Colors.transparent;
  static const Color kBlack = Color(0xFF262626);
  static const Color kGreyColor = Color(0xFF6C757D);
  static const Color kgreyToWhite = Color(0xFFF6F7FA);
  static const Color kRedColor = Color(0xFFFF5757);

  static const EdgeInsets cardPadding = EdgeInsets.all(kDefaultSpacing);

  // Text Styles
  static const TextStyle kBlackTextStyle = TextStyle(
    color: kBlack,
  );

  static const TextStyle kBoldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kItalicBlueTextStyle = TextStyle(
    fontStyle: FontStyle.italic,
    color: kDefaultColor,
  );

  static TextStyle appbarTextStyle = const TextStyle(
    fontSize: kFontsize20,
    fontWeight: kFontWeight500,
  ).merge(kBlackTextStyle);

  static TextStyle btnTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: kFontsize20,
      fontWeight: kFontWeight400,
    );
  }

  static TextStyle footerAuthMessage = const TextStyle(
    decoration: TextDecoration.underline,
  ).merge(kBoldTextStyle).merge(kItalicBlueTextStyle);

  static TextStyle customTextStyle(Color color, double fontSize) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: kFontWeight500,
    );
  }

  static TextStyle AppbarTextStyle(Color color, double fontSize) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: kFontWeight500,
        letterSpacing: 1);
  }

  static TextStyle secondTextSpanStyle() {
    return const TextStyle(
      fontSize: kFontsize15,
      fontWeight: FontWeight.bold,
    ).merge(kBlackTextStyle);
  }
}
