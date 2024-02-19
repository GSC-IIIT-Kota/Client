import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class POutlinedButtonTheme {
  POutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.rani,
      side: const BorderSide(color: TColors.rani),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: TColors.rani, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: TColors.rani,
      side: const BorderSide(color: TColors.rani),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, color: TColors.rani, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}