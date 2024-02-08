import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PCardIconText extends StatelessWidget {
  const PCardIconText({
    super.key, required this.iconData, this.iconSize, this.iconColor, required this.title, required this.titleStyle,
  });

  final IconData iconData;
  final double? iconSize;
  final Color? iconColor;
  final String title;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, size: iconSize, color: iconColor,),
        const SizedBox(width: TSizes.spaceBtwItems / 2,),
        Text(title,
          style: titleStyle,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

