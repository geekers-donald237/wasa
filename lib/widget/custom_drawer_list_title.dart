import 'package:flutter/material.dart';

import '../config/theme/theme.dart';
import '../config/utils/constant.dart';

class CustomProfileListile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback onTap;

  CustomProfileListile({this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          textColor: AppStyle.kGreyColor,
          iconColor: AppStyle.kDefaultColor,
          title: Text(title),
          leading: Icon(icon),
          onTap: onTap,
        ),
        Divider(
          thickness: kBorderValue1_5,
          color: AppStyle.kgreyToWhite,
        ),
      ],
    );
  }
}
