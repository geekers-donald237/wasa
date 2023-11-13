import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wasa/config/routes/routes_names.dart';
import 'package:wasa/config/utils/localfiles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? email;

  Timer? timer;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      NavigationServices(context).gotoLoginscreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                Localfiles.slpashLogo,
                fit: BoxFit.fill,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
