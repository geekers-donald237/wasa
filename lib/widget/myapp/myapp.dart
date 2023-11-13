import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wasa/config/theme/theme.dart';
import 'package:wasa/pages/splash/splash_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WASA',
      theme: new ThemeData(scaffoldBackgroundColor: AppStyle.kWhite),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: L10n.all,
      home: SplashScreen(),
    );
  }
}
