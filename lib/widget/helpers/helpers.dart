import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wasa/config/routes/routes_names.dart';
import 'package:wasa/widget/rounded_btn.dart';

import '../../config/theme/theme.dart';
import '../../config/utils/constant.dart';
import '../../config/utils/custom_dialog.dart';
import '../../config/utils/localfiles.dart';
import '../custom_drawer_list_title.dart';
import '../custom_textfield.dart';

Widget customSubmitBtn(
  String text, {
  VoidCallback? onTap, // Paramètre onTap optionnel
}) {
  final textColor = AppStyle.kWhite;
  final bgColor = AppStyle.kDefaultColor;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: kHeight50,
      decoration: BoxDecoration(
        color: AppStyle.kDefaultColor,
        borderRadius: BorderRadius.circular(kDefaultSpacing),
        border:
            Border.all(width: kBorderValue1_5, color: AppStyle.kTransparent),
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
          height: kHeight200,
          width: kWidth200,
        ),
        SizedBox(height: kDefaultSpacing),
        buildAuthMessage(text),
      ],
    );
  }
}

Widget customDialogConfirmationBtn(
  String text,
  bool isInverted, {
  VoidCallback? onTap, // Paramètre onTap optionnel
}) {
  final textColor = isInverted ? AppStyle.kWhite : AppStyle.kDefaultColor;
  final bgColor = isInverted ? AppStyle.kDefaultColor : AppStyle.kTransparent;

  return GestureDetector(
    onTap: onTap, // Attachez onTap au GestureDetector
    child: Container(
      width: kWidth45,
      height: kHeight45,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(kDefaultSpacing),
        border: Border.all(width: kBorderValue1_5, color: AppStyle.kBlack),
      ),
      child: Center(
        child: Text(text, style: AppStyle.btnTextStyle(textColor)),
      ),
    ),
  );
}

Widget buildAuthMessage(String text) {
  return Row(
    children: [
      const BuildAroundDividerText(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultSpacing),
        child: Text(
          text,
          style: TextStyle(
            color: AppStyle.kGreyColor,
            fontSize: kFontsize20,
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
        thickness: kBorderValue0_5,
        color: AppStyle.kGreyColor,
      ),
    );
  }
}

Padding mainViewDivider() {
  return Padding(
    padding:
        const EdgeInsets.only(left: kDefaultSpacing, right: kDefaultSpacing),
    child: Divider(
      thickness: kBorderValue1_5,
      color: AppStyle.kgreyToWhite,
    ),
  );
}

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.email_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.pwd_field,
          isPassword: true,
        ),
        SizedBox(height: kDefaultSpacing),
        buildForgetPasswordRow(context),
        SizedBox(height: kDefaultSpacing),
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
        SizedBox(height: kDefaultSpacing),
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
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: 'confirm password',
          isPassword: true,
        ),
        const SizedBox(height: kDefaultSpacing),
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
        const SizedBox(width: kSmallerSpacing),
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
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.email_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.person_outline_sharp,
          hintText: AppLocalizations.of(context)!.first_name_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.email_outlined,
          hintText: AppLocalizations.of(context)!.last_name_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.phone_in_talk_outlined,
          hintText: AppLocalizations.of(context)!.phone_number_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.location_on_outlined,
          hintText: AppLocalizations.of(context)!.adr_field,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.pwd_field,
          isPassword: true,
        ),
        SizedBox(height: kDefaultSpacing),
        CustomTextField(
          icon: Icons.lock_outline,
          hintText: AppLocalizations.of(context)!.cpwd_name_field,
          isPassword: true,
        ),
        SizedBox(height: kDefaultSpacing),
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
      margin: EdgeInsets.symmetric(vertical: kDefaultSpacing),
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
                borderRadius: BorderRadius.circular(kDefaultSpacing),
                borderSide:
                    BorderSide(color: AppStyle.kBlack, width: kBorderValue1_5),
              ), // Bordure de la zone de texte
              contentPadding:
                  EdgeInsets.all(kDefaultSpacing), // Rembourrage interne
            ),
          ),
          SizedBox(
            height: kSmallerSpacing,
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
      padding: const EdgeInsets.all(kDefaultSpacing),
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
            height: kQuintupleSpacing,
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
    padding: const EdgeInsets.all(kDefaultSpacing),
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
          padding: EdgeInsets.all(kDefaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Container(
                      width: kWidth100,
                      height: kHeight100,
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
                          style: AppStyle.customTextStyle(
                              AppStyle.kGreyColor, kFontsize15)),
                      SizedBox(
                        height: kDefaultSpacing,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationServices(context).gotoDisciplineProfile();
                        },
                        child: Container(
                          width: kWidth155,
                          height: kHeight45,
                          decoration: BoxDecoration(
                            color: AppStyle.kRedColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultSpacing),
                          ),
                          child: Center(
                            child: Text(
                              'Consulter',
                              textAlign: TextAlign.center,
                              style: AppStyle.customTextStyle(
                                  AppStyle.kWhite, kFontsize15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Pas d’incident enregistré pour cet étudiant',
                    textAlign: TextAlign.center,
                    style: AppStyle.customTextStyle(
                        AppStyle.kGreyColor, kFontsize12),
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultSpacing,
              ),
              Row(
                children: [
                  Text(
                    'Emombo Yaounde',
                    textAlign: TextAlign.center,
                    style: AppStyle.customTextStyle(
                        AppStyle.kGreyColor, kFontsize12),
                  ),
                  SizedBox(
                    width: kSmallerSpacing,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: kIconSize,
                    color: AppStyle.kGreyColor,
                  )
                ],
              ),
              SizedBox(
                height: kDefaultSpacing,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigationServices(context).gotoDisciplineProfile();
                    },
                    child: Container(
                      width: kWidth200,
                      height: kHeight30,
                      decoration: BoxDecoration(
                        color: AppStyle.kDefaultColor,
                        borderRadius: BorderRadius.circular(kSmallerSpacing),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Cahier de discipline',
                            style: AppStyle.customTextStyle(
                                AppStyle.kWhite, kFontsize12),
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

class LabeledRow extends StatelessWidget {
  final RoundedButton roundedButton;
  final String labelText;
  final bool isPermuted;

  const LabeledRow({
    required this.roundedButton,
    required this.labelText,
    this.isPermuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: isPermuted
          ? [
              Text(
                '$labelText: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757D85),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              roundedButton,
            ]
          : [
              roundedButton,
              SizedBox(height: kDoubleSpacing),
              Text(
                ': $labelText  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757D85),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
    );
  }
}

Padding buildEtablishementContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(kDefaultSpacing),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: AppStyle.kDefaultColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppStyle.kgreyToWhite,
          ),
          padding: EdgeInsets.all(kDefaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  NavigationServices(context).gotoTeacherAllClasses();
                },
                child: LabeledRow(
                  roundedButton: RoundedButton(
                    buttonColor: AppStyle.kGreen,
                    buttonText: 'View',
                  ),
                  labelText: 'greenfelder group',
                  isPermuted: true,
                ),
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kDefaultColor,
                  buttonText: 'Category',
                ),
                labelText: 'secondary',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kRedColor,
                  buttonText: 'Adresse',
                ),
                labelText: '186 reidville, CA 38749',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kGreen,
                  buttonText: 'E-mail',
                ),
                labelText: 'danymckenny@gmail.com',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kDefaultColor,
                  buttonText: 'Postal code',
                ),
                labelText: '00951',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kRedColor,
                  buttonText: 'Phone',
                ),
                labelText: '+237 693 350 501',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kGreen,
                  buttonText: 'Type',
                ),
                labelText: 'private',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding buildAdminContainer(BuildContext context, String title, String value,
    String buttonText, String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(kDefaultSpacing),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: AppStyle.kGreen,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppStyle.kgreyToWhite,
          ),
          padding: EdgeInsets.all(kDefaultSpacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Première colonne
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kDefaultSpacing,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6C757D),
                      fontSize: 14,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultSpacing,
                  ),
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757D85),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultSpacing,
                  ),
                  Container(
                    width: kWidth95,
                    height: kHeight35,
                    decoration: BoxDecoration(
                      color: AppStyle.kGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        buttonText,
                        textAlign: TextAlign.center,
                        style: AppStyle.customTextStyle(
                            AppStyle.kWhite, kFontsize12),
                      ),
                    ),
                  ),
                ],
              ),

              // Image à la fin
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Padding buildAdminEtablishementContainer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(kDefaultSpacing),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: AppStyle.kDefaultColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppStyle.kgreyToWhite,
          ),
          padding: EdgeInsets.all(kDefaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'greenfelder group: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF757D85),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue, // Couleur de l'icône d'édition
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel_outlined,
                            color:
                                Colors.red, // Couleur de l'icône de suppression
                          ),
                        ),
                      ],
                    )
                  ]),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kDefaultColor,
                  buttonText: 'Category',
                ),
                labelText: 'secondary',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kRedColor,
                  buttonText: 'Adresse',
                ),
                labelText: '186 reidville, CA 38749',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kGreen,
                  buttonText: 'E-mail',
                ),
                labelText: 'danymckenny@gmail.com',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kDefaultColor,
                  buttonText: 'Postal code',
                ),
                labelText: '00951',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kRedColor,
                  buttonText: 'Phone',
                ),
                labelText: '+237 693 350 501',
              ),
              SizedBox(height: kDoubleSpacing),
              LabeledRow(
                roundedButton: RoundedButton(
                  buttonColor: AppStyle.kGreen,
                  buttonText: 'Type',
                ),
                labelText: 'private',
              ),
              SizedBox(height: kDoubleSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: RoundedButton(
                      onTap: () {
                        NavigationServices(context).gotoAdminview();
                      },
                      buttonColor: AppStyle.kRedColor,
                      buttonText: 'See More',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class InfoRow extends StatelessWidget {
  final String label;
  final Widget value;

  InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAndWidgetRow(
          firstText: label,
          secondWidget: value,
        ),
        Divider(),
        SizedBox(
          height: kSmallSpacing,
        ),
      ],
    );
  }
}

class YourContainer extends StatelessWidget {
  final String numero;
  final String classe;
  final String date;

  YourContainer(
      {required this.numero, required this.classe, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultSpacing),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
              color: AppStyle.kDefaultColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppStyle.kgreyToWhite,
            ),
            padding: EdgeInsets.all(kDefaultSpacing),
            child: Column(
              children: [
                InfoRow(
                  label: 'Numero',
                  value: Text(numero),
                ),
                InfoRow(
                  label: 'Nom',
                  value: Text(classe),
                ),
                InfoRow(
                  label: 'Date de creation',
                  value: Text(
                    date,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF3BA859),
                      fontSize: 14,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                InfoRow(
                  label: 'Options',
                  value: RoundedButton(
                    onTap: () {
                      NavigationServices(context).gotoTeacherAllStudents();
                    },
                    buttonColor: AppStyle.kRedColor,
                    buttonText: 'View',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
              color: AppStyle.kDefaultColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextAndWidgetRow extends StatelessWidget {
  final String firstText;
  final Widget secondWidget;

  TextAndWidgetRow({required this.firstText, required this.secondWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: TextStyle(
            color: Color(0xFF1C1F34),
            fontSize: 15,
            fontFamily: 'Work Sans',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        secondWidget,
      ],
    );
  }
}

AppBar customAppbar(String text, BuildContext context, bool displayAddBtn) {
  return AppBar(
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyle.AppbarTextStyle(AppStyle.kBlack, kFontsize15),
    ),
    centerTitle: true,
    backgroundColor: AppStyle.kWhite,
    elevation: kZeroValue,
    iconTheme: IconThemeData(color: AppStyle.kBlack),
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
                  size: kIconSizeAppbar,
                ),
              ))
          : Container(),
    ],
  );
}

AppBar customTeacherAppbar(String text, BuildContext context) {
  return AppBar(
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyle.AppbarTextStyle(AppStyle.kBlack, kFontsize15),
    ),
    centerTitle: true,
    backgroundColor: AppStyle.kWhite,
    elevation: kZeroValue,
    iconTheme: IconThemeData(color: AppStyle.kBlack),
    actions: [
      IconButton(
          onPressed: () => {
                showAddChildrenModal(context),
              },
          icon: Icon(
            Icons.more_vert_outlined,
            color: AppStyle.kBlack,
            size: kIconSize,
          ))
    ],
  );
}
