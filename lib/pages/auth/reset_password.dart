import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/theme/theme.dart';
import '../../config/utils/constant.dart';
import '../../config/utils/custom_dialog.dart';
import '../../widget/helpers/helpers.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('', context, false),
      extendBodyBehindAppBar: false,
      body: Container(
        decoration: BoxDecoration(color: AppStyle.kWhite),
        child: Padding(
          padding: EdgeInsets.all(kDefaultSpacing),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderWidget(
                  text: AppLocalizations.of(context)!.reset_password,
                ),
                const SizedBox(height: kDefaultSpacing),
                ResetFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
