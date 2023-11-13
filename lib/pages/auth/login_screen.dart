import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasa/config/routes/routes_names.dart';
import 'package:wasa/config/theme/theme.dart';
import 'package:wasa/widget/helpers/helpers.dart';
import '../../config/utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/utils/custom_dialog.dart';

class LoginScreen extends StatelessWidget {
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
        body: Container(
          margin: EdgeInsets.only(top: kDoubleSpacing),
          decoration: BoxDecoration(color: AppStyle.kWhite),
          child: Padding(
            padding: EdgeInsets.all(kDefaultSpacing),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderWidget(
                    text: AppLocalizations.of(context)!.login_message,
                  ),
                  const SizedBox(height: kDefaultSpacing),
                  LoginFormWidget(),
                  const SizedBox(height: kTripleSpacing),
                  FooterWidget(
                    ontap: () {
                      NavigationServices(context).gotoRegisterscreen();
                    },
                    text1: AppLocalizations.of(context)!.login_not_member,
                    text2: AppLocalizations.of(context)!.register_now,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
