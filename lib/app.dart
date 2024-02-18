import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/onboarding.dart';
import 'package:solution_challenge/utils/theme/theme.dart';
import 'package:solution_challenge/utils/translator/translator.dart'; // Import the StringTranslator class
import 'package:solution_challenge/utils/translator/translated_strings.dart'; // Import the file to store translated strings

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    String toLanguage = "ar";
    StringTranslator stringTranslator = StringTranslator();

    return FutureBuilder<List<String>>(
      future: stringTranslator.translateList(toLanguage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error occurred while translating strings.'),
              ),
            ),
          );
        } else {
          // Assign translated strings to the variable in translated_strings.dart
          translatedStrings = snapshot.data;

          print(translatedStrings); // Print the translated strings

          return GetMaterialApp(
            themeMode: ThemeMode.system,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            home: const OnBoardingScreen(),
          );
        }
      },
    );
  }
}
