import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PSectionHeading extends StatelessWidget {
  const PSectionHeading({
    super.key,
    this.textColor = Colors.white,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "View all",
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                foregroundColor: TColors.rani
              ),
              child: Text(buttonTitle))
      ],
    );
  }
}
