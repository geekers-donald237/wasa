import 'package:flutter/material.dart';
import 'package:wasa/config/theme/theme.dart';

import '../config/utils/constant.dart';

class IconTextRow extends StatelessWidget {
  final IconData icon;
  final String text;

  IconTextRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: AppStyle.defaultIconColor,
              size: iconSize,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppStyle.kGreyColor,
                fontSize: fontsize_15,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
