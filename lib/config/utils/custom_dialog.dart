import 'package:flutter/material.dart';

import '../../widget/custom_textfield.dart';
import '../../widget/helpers/helpers.dart';
import '../theme/theme.dart';
import 'constant.dart';

void showConfirmationDialog(BuildContext context, String title,
    {String? subtitle, VoidCallback? onTap}) {
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

      Widget confirmButton = customDialogConfirmationBtn(
        'Yes',
        true,
        onTap: onTap ??
            () {}, // Utiliser le rappel si défini, sinon un callback vide
      );

      List<Widget> contentWidgets = subtitle != null
          ? [
              Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: kDefaultSpacing),
            ]
          : [];

      contentWidgets.addAll([
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: cancelButton),
            SizedBox(width: kDefaultSpacing),
            Expanded(child: confirmButton),
          ],
        ),
      ]);

      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: contentWidgets,
        ),
      );
    },
  );
}

void showAddChildrenModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Ajouter un enfant',
            textAlign: TextAlign.center,
            style: AppStyle.customTextStyle(AppStyle.kGreyColor, kFontsize20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              icon: Icons.person,
              hintText: 'Code de l\'enfant',
            ),
            const SizedBox(height: kDoubleSpacing),
            customSubmitBtn(
              'Ajouter',
            ),
          ],
        ),
      );
    },
  );
}

void showRemarqModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

      return AlertDialog(
        title: Text('Ajouter une Remarque',
            textAlign: TextAlign.center,
            style: AppStyle.customTextStyle(AppStyle.kGreyColor, kFontsize20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              icon: Icons.monitor_heart_outlined,
              hintText: 'Type de L\'incident',
            ),
            TextAreaWithLabel(
              labelText: 'Query ',
              controller: TextEditingController(),
              labelPositionIscentered: true,
            ),
            const SizedBox(height: kDoubleSpacing),
            customSubmitBtn(
              'Ajouter',
            ),
          ],
        ),
      );
    },
  );
}
