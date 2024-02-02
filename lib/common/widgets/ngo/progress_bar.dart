import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PProgressBar extends StatelessWidget {
  const PProgressBar({
    super.key,
    required this.progressValue,
  });

  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progressValue,
      backgroundColor: TColors.accent,
      // Background color of the progress bar
      valueColor:
      const AlwaysStoppedAnimation<Color>(TColors.rani),
    );
  }
}