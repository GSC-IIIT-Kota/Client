import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PProgressText extends StatelessWidget {
  const PProgressText({
    super.key,
    required this.raisedMoney,
    required this.progressValue,
  });

  final int raisedMoney;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.sm, left: TSizes.sm, bottom: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Raised money
          Text(
            'Raised: \$ ${raisedMoney.toString()}',
            style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.primary),
          ),

          /// Percentage text
          Text(
            "${(progressValue * 100).toInt()}%",
            style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.primary),
          ),
        ],
      ),
    );
  }
}