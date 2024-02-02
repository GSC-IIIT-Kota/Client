import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PShadowStyle {
  static final cardShadow = BoxShadow(
    color: TColors.burgandy.withOpacity(0.4),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

}
