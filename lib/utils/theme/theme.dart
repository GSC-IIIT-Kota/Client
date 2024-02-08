import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/theme/custom_themes/text_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/appbar_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/chip_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:solution_challenge/utils/theme/custom_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: TColors.satin,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: PAppBarTheme.lightAppBarTheme,
    checkboxTheme: PCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: TColors.myblack,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: PAppBarTheme.darkAppBarTheme,
    checkboxTheme: PCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: PElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}