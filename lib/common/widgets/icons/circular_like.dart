import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PCircularLike extends StatelessWidget {
  const PCircularLike({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35, // Adjust the size as needed
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: dark ? TColors.myblack.withOpacity(0.8) : Colors.white
              .withOpacity(0.8), // You can change the color
        ),
        child: const Icon(
          Iconsax.like,
          color: TColors.brightpink,
        ),
      ),
    );
  }
}