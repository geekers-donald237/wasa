import 'package:flutter/material.dart';
import 'package:wasa/config/theme/theme.dart';
import 'package:wasa/widget/helpers/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/routes/routes_names.dart';
import '../../config/utils/constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: customAppbar('', context, false),
      body: Container(
        decoration: BoxDecoration(color: AppStyle.kWhite),
        child: Padding(
          padding: EdgeInsets.all(kDefaultSpacing),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // HeaderWidget(
                //   text: AppLocalizations.of(context)!.register_message,
                // ),
                buildAuthMessage(
                  AppLocalizations.of(context)!.register_message,
                ),

                RegisterFormWidget(),
                const SizedBox(height: kTripleSpacing),
                FooterWidget(
                  ontap: () {
                    NavigationServices(context).gotoLoginscreen();
                  },
                  text1: AppLocalizations.of(context)!.already_member,
                  text2: AppLocalizations.of(context)!.login_now,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
