import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/custom_textfield.dart';
import '../../widget/helpers/helpers.dart';
import '../theme/theme.dart';
import 'constant.dart';

void showConfirmationExitDialog(
    BuildContext context, String title, VoidCallback onYesTap) {
  showDialog(
    context: context,
    builder: (context) {
      Widget cancelButton = customDialogConfirmationBtn(
        'No',
        false,
        onTap: () {
          Navigator.of(context).pop();
        },
      );

      Widget confirmButton =
          customDialogConfirmationBtn('Yes', true, onTap: onYesTap);

      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: cancelButton),
                SizedBox(width: doubleSpacing),
                Expanded(child: confirmButton),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget customDialogConfirmationBtn(
  String text,
  bool isInverted, {
  VoidCallback? onTap, // Paramètre onTap optionnel
}) {
  final textColor = isInverted ? AppStyle.kWhite : AppStyle.kDefaultColor;
  final bgColor = isInverted ? AppStyle.kDefaultColor : AppStyle.kTransparent;

  return GestureDetector(
    onTap: onTap, // Attachez onTap au GestureDetector
    child: Container(
      width: widht_80,
      height: height_45,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(defaultSpacing),
        border: Border.all(width: customBorderWidth, color: AppStyle.kBlack),
      ),
      child: Center(
        child: Text(text, style: AppStyle.btnTextStyle(textColor)),
      ),
    ),
  );
}

void showAddChildrenModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Ajouter un enfant',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF757D85),
            fontSize: 20,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              icon: Icons.person,
              hintText: 'Code de l\'enfant',
            ),
            SizedBox(height: 20),
            customSubmitBtn(
              'Ajouter',
            ),
          ],
        ),
      );
    },
  );
}



void showConfirmationDialog(BuildContext context, String title, String subtitle,
    VoidCallback onYesTap) {
  showDialog(
    context: context,
    builder: (context) {
      Widget cancelButton = customDialogConfirmationBtn(
        'No',
        false,
        onTap: () {
          Navigator.of(context).pop();
        },
      );

      Widget confirmButton =
          customDialogConfirmationBtn('Yes', true, onTap: onYesTap);

      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: doubleSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: cancelButton),
                SizedBox(width: doubleSpacing),
                Expanded(child: confirmButton),
              ],
            ),
          ],
        ),
      );
    },
  );
}

