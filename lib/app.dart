import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/personalization/screens/settings/language.dart';
import 'package:solution_challenge/utils/theme/theme.dart';

class App extends StatelessWidget {

  const App({super.key}); // Default language

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const LanguageScreen(),
    );
  }
}
