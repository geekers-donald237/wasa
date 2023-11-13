import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wasa/config/utils/helpers.dart';
import 'package:wasa/widget/helpers/helpers.dart';

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
    return Scaffold(
      appBar: customAppbar('settings', context, false),
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: EdgeInsets.all(defaultSpacing),
        child: ListView(children: <Widget>[
          // Center(child: BuildDrawerUserProfile(false)),
          Column(
            children: [
              CustomDrawerListile(
                icon: Icons.person,
                title: 'profile',
                onTap: () {
                  NavigationServices(context).gotoViewProfile();
                },
              ),
              CustomDrawerListile(
                icon: Icons.lock_outlined,
                title: 'Change Password',
                onTap: () {
                  NavigationServices(context).gotoForgetPwdScreen();
                },
              ),
              CustomDrawerListile(
                icon: Icons.help_center,
                title: 'Help Center',
                onTap: () {
                  NavigationServices(context).gotoHelpCenter();
                },
              ),
              CustomDrawerListile(
                icon: Icons.policy_outlined,
                title: 'Terms and Conditions',
                onTap: () {
                  NavigationServices(context).gotoTermsAndConditions();
                },
              ),
              CustomDrawerListile(
                icon: Icons.logout_outlined,
                title: 'Logout',
                onTap: () {
                  showConfirmationDialog(context, 'Delete Your Account',
                      'Are you sure you want to delete your account permanently?',
                      () {
                    Navigator.of(context).pop();
                  });
                },
              ),
              CustomDrawerListile(
                icon: Icons.delete_outline,
                title: 'Delete Account',
                onTap: () {
                  showConfirmationDialog(
                      context, 'Log Out', 'Do you want to log Out?', () {
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
