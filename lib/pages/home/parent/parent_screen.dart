import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wasa/config/utils/constant.dart';
import 'package:wasa/widget/helpers/helpers.dart';

import '../../../config/utils/helpers.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showConfirmationExitDialog(
            context, AppLocalizations.of(context)!.exit_app, () {
          SystemNavigator.pop();
        });
        return false;
      },
      child: Scaffold(
        appBar: customAppbar('Parent / enfant', context, true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              mainViewDivider(),
              buildStudentContainer(context),
              SizedBox(
                height: doubleSpacing,
              ),
              buildStudentContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}