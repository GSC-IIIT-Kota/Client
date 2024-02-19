import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PElevatedButtonTheme {
  PElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.rani,
      disabledForegroundColor: TColors.battleship,
      disabledBackgroundColor: TColors.battleship,
      side: const BorderSide(color: TColors.rani),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.rani,
      disabledForegroundColor: TColors.battleship,
      disabledBackgroundColor: TColors.battleship,
      side: const BorderSide(color: TColors.rani),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    )
  );
}