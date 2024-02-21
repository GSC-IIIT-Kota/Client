import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/onboarding.dart';
import 'package:solution_challenge/utils/theme/theme.dart';
import 'package:solution_challenge/utils/translator/strings_en.dart' as en;
import 'package:solution_challenge/utils/translator/strings_hi.dart' as hi;
import 'package:solution_challenge/utils/translator/strings_es.dart' as es;
import 'package:solution_challenge/utils/translator/strings_de.dart' as de;
import 'package:solution_challenge/utils/translator/strings_fr.dart' as fr;
import 'package:solution_challenge/utils/translator/strings_ru.dart' as ru;
import 'package:solution_challenge/utils/translator/strings_ko.dart' as ko;
import 'package:solution_challenge/utils/translator/strings_ja.dart' as ja;
import 'package:solution_challenge/utils/translator/strings_pt.dart' as pt;
import 'package:solution_challenge/utils/translator/strings_ar.dart' as ar;
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/userPrefernces/userPrefernce.dart';

import 'navigation_menu.dart';

class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  const App({super.key});
}

class _MyAppState extends State<App> {
  final String language = "en";
  List<String> getTranslatedStrings() {
    switch (language) {
      case 'en':
        return en.originalStrings;
      case 'hi':
        return hi.originalStrings;
      case 'es':
        return es.originalStrings;
      case 'de':
        return de.originalStrings;
      case 'fr':
        return fr.originalStrings;
      case 'ru':
        return ru.originalStrings;
      case 'ko':
        return ko.originalStrings;
      case 'ja':
        return ja.originalStrings;
      case 'pt':
        return pt.originalStrings;
      case 'ar':
        return ar.originalStrings;
      default:
        return en.originalStrings; // Default to English
    }
  }

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    translatedStrings = getTranslatedStrings();
    return FutureBuilder<bool>(
      future: isUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final loggedIn = snapshot.data ?? false;
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
        },
      );
     }
  }

