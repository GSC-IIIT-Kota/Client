import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/utils/constants/colors.dart';

class PEducationAppBar extends StatelessWidget {
  const PEducationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hey Beautiful,",style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.accent)),
          Text("Username",style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.category, color: Colors.white,))
      ],
    );
  }
}