import 'package:flutter/material.dart';

class PProgressBar extends StatelessWidget {
  const PProgressBar({
    super.key,
    required this.progressValue, required this.backgroundColor, required this.progressColor,
  });

  final double progressValue;
  final Color backgroundColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progressValue,
      backgroundColor: backgroundColor,
      // Background color of the progress bar
      valueColor:
      AlwaysStoppedAnimation<Color>(progressColor),
    );
  }
}