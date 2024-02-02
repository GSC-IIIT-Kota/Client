import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PNotificationIcon extends StatelessWidget {
  const PNotificationIcon({
    super.key, required this.onPressed, required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: const Icon(Iconsax.notification), color: iconColor,),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: TColors.accent,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text("2", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.myblack),),
            ),
          ),
        )
      ],
    );
  }
}
