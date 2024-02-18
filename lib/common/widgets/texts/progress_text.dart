import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PCardProgressText extends StatelessWidget {
  const PCardProgressText({
    super.key,
    required this.raisedMoney,
    required this.totalGoal,
  });

  final int raisedMoney;
  final int totalGoal;

  @override
  Widget build(BuildContext context) {
    final double progressValue = raisedMoney / totalGoal;
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.xs, left: TSizes.xs, bottom: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Raised money
          Text(
            'Raised: \$ ${raisedMoney.toString()}',
            style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.rani, fontWeightDelta: 2),
          ),

          /// Percentage text
          Text(
            "${(progressValue * 100).toInt()}%",
            style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.rani, fontWeightDelta: 2),
          ),
        ],
      ),
    );
  }
}

class PProfileProgressText extends StatelessWidget {
  const PProfileProgressText({
    super.key,
    required this.raisedMoney, required this.totalGoal,
  });

  final int raisedMoney;
  final int totalGoal;

  @override
  Widget build(BuildContext context) {
    final double progressValue = raisedMoney / totalGoal;
    final dark = PHelperFunctions.isDarkMode(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Raised money
          Text(
            'Goal: \$ ${totalGoal.toString()}',
            style: Theme.of(context).textTheme.labelLarge!.apply(color: dark ? Colors.white : Colors.black, fontWeightDelta: 2),
          ),

          /// Percentage text
          Text(
            "Raised: \$ ${raisedMoney.toString()} (${(progressValue * 100).toInt()}%)",
            style: Theme.of(context).textTheme.labelLarge!.apply(color: dark ? TColors.brightpink : TColors.rani, fontWeightDelta: 2),
          ),
        ],
    );
  }
}
