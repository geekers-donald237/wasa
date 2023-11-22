import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasa/config/utils/custom_dialog.dart';
import 'package:wasa/widget/helpers/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/routes/routes_names.dart';
import '../../../config/utils/constant.dart';
import '../../../widget/custom_drawer_list_title.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showConfirmationDialog(
          context,
          AppLocalizations.of(context)!.exit_app,
        );
        return false;
      },
      child: Scaffold(
        appBar: customAppbar('settings', context, false),
        extendBodyBehindAppBar: false,
        body: Padding(
          padding: EdgeInsets.all(kDefaultSpacing),
          child: ListView(children: <Widget>[
            Column(
              children: [
                CustomProfileListile(
                  icon: Icons.person,
                  title: 'profile',
                  onTap: () {
                    NavigationServices(context).gotoViewProfile();
                  },
                ),
                CustomProfileListile(
                  icon: Icons.lock_outlined,
                  title: 'Change Password',
                  onTap: () {
                    NavigationServices(context).gotoForgetPwdScreen();
                  },
                ),
                CustomProfileListile(
                  icon: Icons.help_center,
                  title: 'Help Center',
                  onTap: () {
                    NavigationServices(context).gotoHelpCenter();
                  },
                ),
                CustomProfileListile(
                  icon: Icons.policy_outlined,
                  title: 'Terms and Conditions',
                  onTap: () {
                    NavigationServices(context).gotoTermsAndConditions();
                  },
                ),
                CustomProfileListile(
                  icon: Icons.logout_outlined,
                  title: 'Logout',
                  onTap: () {
                    showConfirmationDialog(
                      context,
                      'Logout ',
                      subtitle: 'do you want to Logout ?',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
                CustomProfileListile(
                  icon: Icons.delete_outline,
                  title: 'Delete Account',
                  onTap: () {
                    showConfirmationDialog(
                      context,
                      'Delete Your Account',
                      subtitle:
                          'Are you sure you want to delete your account permanently?',
                      onTap: () {
                        SystemNavigator.pop();
                      },
                    );
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
