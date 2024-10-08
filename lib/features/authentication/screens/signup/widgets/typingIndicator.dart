import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // Align to the right for incoming messages
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: TColors.rani,
          ),
        ),
        SizedBox(width: 8),
        Text('Typing...', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
