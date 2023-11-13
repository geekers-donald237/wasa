import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/routes/routes_names.dart';
import '../../config/theme/theme.dart';
import '../../config/utils/constant.dart';
import '../../config/utils/helpers.dart';
import '../../widget/helpers/helpers.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('', context, false),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: AppStyle.kWhite),
          child: Padding(
            padding: EdgeInsets.all(defaultSpacing),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderWidget(
                    text: AppLocalizations.of(context)!.forget_pwd_message,
                  ),
                  const SizedBox(height: doubleSpacing),
                  ForgetPwdFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
