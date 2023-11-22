import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/utils/custom_dialog.dart';
import '../../../widget/helpers/helpers.dart';

class TeacherMainViewScreen extends StatefulWidget {
  const TeacherMainViewScreen({super.key});

  @override
  State<TeacherMainViewScreen> createState() => _TeacherMainViewState();
}

class _TeacherMainViewState extends State<TeacherMainViewScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showConfirmationDialog(
          context,
          AppLocalizations.of(context)!.exit_app,
          onTap: () {
            () {
              SystemNavigator.pop();
            };
          },
        );
        return false;
      },
      child: Scaffold(
        appBar: customTeacherAppbar('Enseignant / etablissement', context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildEtablishementContainer(context),
            ],
            
          ),
        ),
      ),
    );
  }
}
