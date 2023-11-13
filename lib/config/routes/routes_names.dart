import 'package:flutter/material.dart';
import 'package:wasa/pages/auth/forget_pwd.dart';
import 'package:wasa/pages/auth/login_screen.dart';
import 'package:wasa/pages/auth/opt.dart';
import 'package:wasa/pages/auth/opt_register.dart';
import 'package:wasa/pages/auth/register_screen.dart';
import 'package:wasa/pages/auth/reset_password.dart';
import 'package:wasa/pages/home/parent/student_details/absence.dart';
import 'package:wasa/pages/home/parent/student_details/incident.dart';
import 'package:wasa/pages/home/parent/student_details/retard.dart';
import 'package:wasa/pages/home/profile/edit_profil.dart';
import 'package:wasa/pages/home/profile/help_center.dart';
import 'package:wasa/pages/home/profile/terms_and_condition.dart';

import '../../pages/home/parent/disciplinary_info.dart';
import '../../widget/bottom_bar/nav_bar.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  void back(Widget widget) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  Future<dynamic> gotoLoginscreen() async {
    return await _pushMaterialPageRoute(LoginScreen());
  }

  Future<dynamic> gotoRegisterscreen() async {
    return await _pushMaterialPageRoute(const RegisterScreen());
  }

  Future<dynamic> gotoNavscreen() async {
    return await _pushMaterialPageRoute(const NavigationBottomBar());
  }

  Future<dynamic> gotoDisciplineProfile() async {
    return await _pushMaterialPageRoute(const DisciplinaryInfo());
  }

  Future<dynamic> gotoIncidentDetails() async {
    return await _pushMaterialPageRoute(const IncidentDetailsScreen());
  }

  Future<dynamic> gotoRetardDetails() async {
    return await _pushMaterialPageRoute(const RetardDetailsScreen());
  }

  Future<dynamic> gotoAbsencesDetails() async {
    return await _pushMaterialPageRoute(const AbsenceDetailsScreen());
  }

  Future<dynamic> gotoForgetPwdScreen() async {
    return await _pushMaterialPageRoute(const ForgetPasswordScreen());
  }

  Future<dynamic> gotoResetScreen() async {
    return await _pushMaterialPageRoute(const ResetPasswordScreen());
  }

  Future<dynamic> gotoOptScreen() async {
    return await _pushMaterialPageRoute(const OptScreen());
  }

  Future<dynamic> gotoOptScreenAfterRegister() async {
    return await _pushMaterialPageRoute(const OptRegisterScreen());
  }

  Future<dynamic> gotoViewProfile() async {
    return await _pushMaterialPageRoute(const EditProfilScreen());
  }

  
  Future<dynamic> gotoHelpCenter() async {
    return await _pushMaterialPageRoute(const HelpCenterScreen());
  }

   
  Future<dynamic> gotoTermsAndConditions() async {
    return await _pushMaterialPageRoute(const TermsAndConditionScreen());
  }

  
}
