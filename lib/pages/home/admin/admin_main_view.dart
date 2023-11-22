import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme/theme.dart';
import '../../../config/utils/constant.dart';
import '../../../config/utils/custom_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widget/helpers/helpers.dart';

class AdminMainView extends StatelessWidget {
  const AdminMainView({super.key});

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
        appBar:
            customAppbar('Admin / Liste des Etablissements', context, false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              mainViewDivider(),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     margin: EdgeInsets.only(left: 20, right: 20),
              //     height: kHeight50,
              //     decoration: BoxDecoration(
              //       color: AppStyle.kGreen,
              //       borderRadius: BorderRadius.circular(kDefaultSpacing),
              //       border: Border.all(
              //           width: kBorderValue1_5, color: AppStyle.kTransparent),
              //     ),
              //     child: Center(
              //       child: Text("Ajouter",
              //           style: AppStyle.btnTextStyle(AppStyle.kWhite)),
              //     ),
              //   ),
              // ),
              buildAdminEtablishementContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}
