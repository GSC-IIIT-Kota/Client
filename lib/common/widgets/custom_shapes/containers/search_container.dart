import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PSearchContainer extends StatelessWidget {
  const PSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    //
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    //     child: Container(
    //       width: TDeviceUtils.getScreenWidth(context),
    //       padding: const EdgeInsets.all(TSizes.md),
    //       decoration: BoxDecoration(
    //           color: showBackground
    //               ? dark
    //               ? TColors.myblack
    //               : Colors.white
    //               : Colors.transparent,
    //           borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
    //           border: showBorder ? Border.all(color: Colors.grey) : null),
    //       child: Row(
    //         children: [
    //           Icon(
    //             Iconsax.search_normal,
    //             color: dark ? Colors.white.withOpacity(0.7) : TColors.battleship,
    //           ),
    //           const SizedBox(
    //             width: TSizes.spaceBtwItems,
    //           ),
    //           Text(
    //             text,
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .bodySmall!
    //                 .apply(color: dark ? Colors.white.withOpacity(0.7) : TColors.battleship),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          labelText: text,
        ),
      ),
    );
  }
}