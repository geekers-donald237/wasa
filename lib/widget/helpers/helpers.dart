import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wasa/config/routes/routes_names.dart';

import '../../config/theme/theme.dart';
import '../../config/utils/constant.dart';
import '../../config/utils/helpers.dart';
import '../../config/utils/localfiles.dart';
import '../custom_drawer_list_title.dart';
import '../custom_textfield.dart';

// AppBar customAppbar(String appBarText) {
//   return AppBar(
//     backgroundColor: AppStyle.kTransparent,
//     centerTitle: true,
//     elevation: noElevation,
//     iconTheme: IconThemeData(color: AppStyle.defaultIconColor),
//     title: Text(
//       appBarText,
//       style: AppStyle.appbarTextStyle,
//     ),
//   );
// }

Widget customSubmitBtn(
  String text, {
  VoidCallback? onTap, // Paramètre onTap optionnel
}) {
  final textColor = AppStyle.kWhite;
  final bgColor = AppStyle.kDefaultColor;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: customAuthBtnHeight,
      decoration: BoxDecoration(
        color: AppStyle.kDefaultColor,
        borderRadius: BorderRadius.circular(defaultSpacing),
        border:
            Border.all(width: customBorderWidth, color: AppStyle.kTransparent),
      ),
      child: Center(
        child: Text(text, style: AppStyle.btnTextStyle(textColor)),
      ),
    ),
  );
}

/* *********************** Login Screen helpers ***********************/
class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Localfiles.logo,
          height: LogoHeight,
          width: LogoWidth,
        ),
        SizedBox(height: doubleSpacing),
        buildAuthMessage(text),
      ],
    );
  }
}

Widget buildAuthMessage(String text) {
  return Row(
    children: [
      const BuildAroundDividerText(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
        child: Text(
          text,
          style: TextStyle(
            color: AppStyle.kGreyColor,
            fontSize: fontsize_20,
          ),
        ),
      ),
      const BuildAroundDividerText(),
    ],
  );
}

class BuildAroundDividerText extends StatelessWidget {
  const BuildAroundDividerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        thickness: thicknessValue_05,
        color: AppStyle.kGreyColor,
      ),
    );
  }
}

Padding mainViewDivider() {
  return Padding(
    padding: const EdgeInsets.only(left: defaultSpacing, right: defaultSpacing),
    child: Divider(
      thickness: thicknessValue_15,
      color: AppStyle.kgreyToWhite,
    ),
  );
}

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.email_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.pwd_field,
          isPassword: true,
        ),
        SizedBox(height: doubleSpacing),
        buildForgetPasswordRow(context),
        SizedBox(height: doubleSpacing),
        customSubmitBtn(
          AppLocalizations.of(context)!.login_message,
          onTap: () {
            NavigationServices(context).gotoNavscreen();
          },
        ),
      ],
    );
  }
}

class OptFormWidget extends StatelessWidget {
  const OptFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ForgetPwdFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.email_field,
        ),
        SizedBox(height: defaultSpacing),
        customSubmitBtn(
          AppLocalizations.of(context)!.sui_msg,
          onTap: () {
            NavigationServices(context).gotoOptScreen();
          },
        ),
      ],
    );
  }
}

class ResetFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.pwd_field,
          isPassword: true,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: 'confirm password',
          isPassword: true,
        ),
        const SizedBox(height: doubleSpacing),
        customSubmitBtn(
          AppLocalizations.of(context)!.sui_msg,
          onTap: () {
            NavigationServices(context).gotoLoginscreen();
          },
        ),
      ],
    );
  }
}

class FooterWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback ontap;

  FooterWidget({required this.text1, required this.text2, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: AppStyle.kGreyColor),
        ),
        const SizedBox(width: defaultSpacing_5),
        GestureDetector(
          onTap: ontap,
          child: Text(
            text2,
            style: AppStyle.footerAuthMessage,
          ),
        ),
      ],
    );
  }
}

buildForgetPasswordRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          Text(AppLocalizations.of(context)!.remember_me_checkbox,
              style: TextStyle(color: AppStyle.kGreyColor)),
        ],
      ),
      GestureDetector(
        onTap: () {
          NavigationServices(context).gotoForgetPwdScreen();
        },
        child: Text(AppLocalizations.of(context)!.forget_pwd_row,
            style: AppStyle.kItalicBlueTextStyle),
      ),
    ],
  );
}

/******** REGISTER *********/
class RegisterFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.email_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.person_outline_sharp,
          hintText: AppLocalizations.of(context)!.first_name_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.last_name_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.phone_in_talk_outlined,
          hintText: AppLocalizations.of(context)!.phone_number_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.location_on_outlined,
          hintText: AppLocalizations.of(context)!.adr_field,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.pwd_field,
          isPassword: true,
        ),
        SizedBox(height: defaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.cpwd_name_field,
          isPassword: true,
        ),
        SizedBox(height: doubleSpacing),
        customSubmitBtn(
          AppLocalizations.of(context)!.register_now,
          onTap: () {
            NavigationServices(context).gotoOptScreenAfterRegister();
          },
        ),
      ],
    );
  }
}

class TextAreaWithLabel extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool labelPositionIscentered;

  TextAreaWithLabel(
      {required this.labelText,
      required this.controller,
      required this.labelPositionIscentered});

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment myAligment = labelPositionIscentered
        ? MainAxisAlignment.center
        : MainAxisAlignment.start;
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            maxLines: 5, // Vous pouvez ajuster le nombre de lignes souhaité
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0x7AECEEF5), // Couleur de fond grise
              hintText: labelText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0x7AECEEF5),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: defaultBorderRadius,
                borderSide: BorderSide(
                    color: AppStyle.kBlack, width: customBorderWidth),
              ), // Bordure de la zone de texte
              contentPadding:
                  EdgeInsets.all(defaultSpacing), // Rembourrage interne
            ),
          ),
          SizedBox(
            height: defaultSpacing_5,
          ),
        ],
      ),
    );
  }
}


class PolicyTextView extends StatelessWidget {
  final String text;

  const PolicyTextView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(doubleSpacing),
      child: SingleChildScrollView(
        child: Expanded(
          child: Text(
            text,
            style: AppStyle.secondTextSpanStyle(),
          ),
        ),
      ),
    );
  }
}


/***** Drawer */
Drawer customHomeDrawer(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: AppStyle.cardPadding,
      child: ListView(
        children: [
          SizedBox(
            height: quintupleSpacing,
          ),
          Column(
            children: [
              CustomDrawerListile(
                icon: Icons.book,
                title: 'View Contract',
                onTap: () {},
              ),
              CustomDrawerListile(
                icon: Icons.help_center,
                title: 'Help Center',
                onTap: () {
                  // NavigationServices(context).gotoHelpCenterScreen();
                },
              ),
              CustomDrawerListile(
                icon: Icons.policy_outlined,
                title: 'Terms and Conditions',
                onTap: () {
                  // NavigationServices(context).gotoTermsAndConditionScreen();
                },
              ),
              CustomDrawerListile(
                icon: Icons.bug_report,
                title: 'Bug Report',
                onTap: () {
                  // NavigationServices(context).gotoPrivacyPolicyScreen();
                },
              ),
              CustomDrawerListile(
                icon: Icons.person_outlined,
                title: 'Profile',
                onTap: () {
                  // NavigationServices(context).gotoPrivacyPolicyScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Padding buildStudentContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(defaultSpacing),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: AppStyle.kDefaultColor, // Couleur de fond bleue
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), // Bordure en haut à gauche
              topRight: Radius.circular(50.0), // Bordure en haut à droite
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppStyle.kgreyToWhite,
          ),
          padding: EdgeInsets.all(defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Container(
                      width: img_width_container,
                      height: img_height_container,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Localfiles.person),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text('NYADJOU LUCIE DANIELLE',
                          textAlign: TextAlign.center,
                          style: AppStyle.studentContainerTextStyle(
                              AppStyle.kGreyColor, fontsize_15)),
                      SizedBox(
                        height: defaultSpacing,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationServices(context).gotoDisciplineProfile();
                        },
                        child: Container(
                          width: student_container_btn_size_width,
                          height: student_container_btn_size_height,
                          decoration: BoxDecoration(
                            color: AppStyle.kRedColor,
                            borderRadius: BorderRadius.circular(doubleSpacing),
                          ),
                          child: Center(
                            child: Text(
                              'Consulter',
                              textAlign: TextAlign.center,
                              style: AppStyle.studentContainerTextStyle(
                                  AppStyle.kWhite, fontsize_15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: defaultSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Pas d’incident enregistré pour cet étudiant',
                    textAlign: TextAlign.center,
                    style: AppStyle.studentContainerTextStyle(
                        AppStyle.kGreyColor, fontsize_12),
                  ),
                ],
              ),
              SizedBox(
                height: defaultSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Emombo Yaounde',
                    textAlign: TextAlign.center,
                    style: AppStyle.studentContainerTextStyle(
                        AppStyle.kGreyColor, fontsize_12),
                  ),
                  SizedBox(
                    width: defaultSpacing_5,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: iconSize,
                    color: AppStyle.kGreyColor,
                  )
                ],
              ),
              SizedBox(
                height: defaultSpacing,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigationServices(context).gotoDisciplineProfile();
                    },
                    child: Container(
                      width: LogoWidth,
                      height: height_30,
                      decoration: BoxDecoration(
                        color: AppStyle.kDefaultColor,
                        borderRadius: BorderRadius.circular(defaultSpacing_5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cahier de discipline',
                            style: AppStyle.studentContainerTextStyle(
                                AppStyle.kWhite, fontsize_12),
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            color: AppStyle.kWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

AppBar customAppbar(String text, BuildContext context, bool displayAddBtn) {
  return AppBar(
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyle.AppbarTextStyle(AppStyle.kBlack, fontsize_15),
    ),
    centerTitle: true,
    backgroundColor: AppStyle.kWhite,
    elevation: noElevation,
    iconTheme: IconThemeData(color: AppStyle.defaultIconColor),
    actions: [
      displayAddBtn
          ? IconButton(
              onPressed: () => {
                    showAddChildrenModal(context),
                  },
              icon: Container(
                decoration: BoxDecoration(
                  color: AppStyle.kWhite, // Couleur de fond grise
                  borderRadius: BorderRadius.circular(
                      5), // Un rayon de 15 pour rendre plus arrondi
                  border: Border.all(
                    color: AppStyle.kGreyColor, // Couleur de la bordure
                    width: 2, // Largeur de la bordure (2 pixels)
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: AppStyle.kGreyColor,
                  size: iconsizeAppbar,
                ),
              ))
          : Container(),
    ],
  );
}
