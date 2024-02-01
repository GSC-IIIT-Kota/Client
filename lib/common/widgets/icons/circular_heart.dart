import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PCircularHeart extends StatelessWidget {
  const PCircularHeart({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: dark ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.2)
      ),
      child: IconButton(onPressed: (){}, icon: Icon(Iconsax.heart5, color: TColors.primary,)),
    );
  }
}