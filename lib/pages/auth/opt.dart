import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wasa/config/routes/routes_names.dart';
import 'package:wasa/pages/home/parent/parent_screen.dart';
import 'package:wasa/widget/helpers/helpers.dart';

import '../../config/utils/constant.dart';
import '../../config/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/utils/localfiles.dart';
import '../../widget/opt_input.dart';

class OptScreen extends StatefulWidget {
  const OptScreen({Key? key}) : super(key: key);

  @override
  State<OptScreen> createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('', context, false),
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  Localfiles.logo,
                  height: LogoHeight,
                  width: LogoWidth,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter the 4 digit verification code received',
                  style: TextStyle(fontSize: 18, color: Color(0xFF5271FF)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    optInputBox(context, txt1),
                    optInputBox(context, txt2),
                    optInputBox(context, txt3),
                    optInputBox(context, txt4),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Haven't received OTP yet?",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    resendTime == 0
                        ? InkWell(
                            onTap: () {
                              // Resend OTP Code
                              invalidOtp = false;
                              resendTime = 60;
                              startTimer();
                              //
                            },
                            child: const Text(
                              'Resend',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(height: 10),
                resendTime != 0
                    ? Text(
                        'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                        style: const TextStyle(fontSize: 18),
                      )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Text(
                  invalidOtp ? 'Invalid otp!' : '',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 20),
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
                    NavigationServices(context).gotoResetScreen();
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
