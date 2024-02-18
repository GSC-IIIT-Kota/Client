import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PCampaignCardDesc extends StatelessWidget {
  const PCampaignCardDesc({
    super.key, required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {

    final dark = PHelperFunctions.isDarkMode(context);
    return Text(desc,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? Colors.white.withOpacity(0.6) : TColors.battleship),
    );
  }
}