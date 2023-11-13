import 'package:flutter/material.dart';
import 'package:wasa/config/routes/routes_names.dart';
import 'package:wasa/config/utils/constant.dart';
import 'package:wasa/widget/helpers/helpers.dart';

import '../../../widget/icon_text_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widget/student_info_details.dart';

class DisciplinaryInfo extends StatelessWidget {
  const DisciplinaryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('Parent / enfant', context, false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainViewDivider(),
            SizedBox(
              height: defaultSpacing,
            ),
            IconTextRow(
              icon: Icons.arrow_right_outlined,
              text: AppLocalizations.of(context)!.cahier_disc,
            ),
            SizedBox(
              height: defaultSpacing,
            ),
            GestureDetector(
              onTap: () {
                NavigationServices(context).gotoAbsencesDetails();
              },
              child: NumberTextWidget(
                  number: '3',
                  text: AppLocalizations.of(context)!.absence_name),
            ),
            GestureDetector(
              onTap: () {
                NavigationServices(context).gotoIncidentDetails();
              },
              child: NumberTextWidget(
                  number: '0',
                  text: AppLocalizations.of(context)!.incident_name),
            ),
            GestureDetector(
              onTap: () {
                NavigationServices(context).gotoRetardDetails();
              },
              child: NumberTextWidget(
                  number: '5', text: AppLocalizations.of(context)!.retard_name),
            ),
          ],
        ),
      ),
    );
  }
}
