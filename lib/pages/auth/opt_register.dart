import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasa/config/theme/theme.dart';
import 'package:wasa/pages/home/parent/parent_screen.dart';
import 'package:wasa/widget/helpers/helpers.dart';

import '../../config/routes/routes_names.dart';
import '../../config/utils/constant.dart';
import '../../config/utils/custom_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/utils/localfiles.dart';
import '../../widget/opt_input.dart';

class OptRegisterScreen extends StatefulWidget {
  const OptRegisterScreen({Key? key}) : super(key: key);

  @override
  State<OptRegisterScreen> createState() => _OptRegisterScreenState();
}

class _OptRegisterScreenState extends State<OptRegisterScreen> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('', context, false),
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultSpacing),
            child: Column(
              children: [
                Image.asset(
                  Localfiles.logo,
                  height: kHeight200,
                  width: kWidth200,
                ),
                SizedBox(height: kDefaultSpacing),
                Text(
                  'Verification Code',
                  style: TextStyle(fontSize: kFontsize30),
                ),
                SizedBox(height: kDefaultSpacing),
                Text(
                  'Enter the 4 digit verification code received',
                  style: TextStyle(
                      fontSize: kFontsize20, color: AppStyle.kDefaultColor),
                ),
                SizedBox(height: kDefaultSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    optInputBox(context, txt1),
                    optInputBox(context, txt2),
                    optInputBox(context, txt3),
                    optInputBox(context, txt4),
                  ],
                ),
                SizedBox(height: kQuadrupleSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven't received OTP yet?",
                      style: TextStyle(fontSize: kFontsize20),
                    ),
                    SizedBox(width: kDefaultSpacing),
                    resendTime == kZeroValue
                        ? InkWell(
                            onTap: () {
                              // Resend OTP Code
                              invalidOtp = false;
                              resendTime = 60;
                              startTimer();
                              //
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                  color: AppStyle.kRedColor,
                                  fontSize: kFontsize20),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
                SizedBox(height: kDefaultSpacing),
                resendTime != kZeroValue
                    ? Text(
                        'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                        style: TextStyle(fontSize: kFontsize20),
                      )
                    : SizedBox(),
                SizedBox(height: kDefaultSpacing),
                Text(
                  invalidOtp ? 'Invalid otp!' : '',
                  style: TextStyle(
                      fontSize: kFontsize20, color: AppStyle.kRedColor),
                ),
                SizedBox(height: kDefaultSpacing),
                customSubmitBtn(
                  'Verify',
                  onTap: () {
                    final otp = txt1.text + txt2.text + txt3.text + txt4.text;
                    if (otp == '1989') {
                      // Go to welcome
                      stopTimer();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ParentHomeView(),
                        ),
                      );
                    } else {
                      setState(() {
                        invalidOtp = true;
                      });
                    }
                    NavigationServices(context).gotoLoginscreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
