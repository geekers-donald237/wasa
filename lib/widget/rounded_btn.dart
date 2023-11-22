import 'package:flutter/material.dart';
import 'package:wasa/config/theme/theme.dart';
import 'package:wasa/config/utils/constant.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final VoidCallback? onTap;

  const RoundedButton({
    required this.buttonColor,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kWidth80,
        height: kHeight35,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultSpacing),
            child: Text(buttonText,
                textAlign: TextAlign.center,
                style: AppStyle.customTextStyle(AppStyle.kWhite, kFontsize12)),
          ),
        ),
      ),
    );
  }
}
