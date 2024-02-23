import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PCampaignCardTitle extends StatelessWidget {
  const PCampaignCardTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .apply(color: dark ? Colors.white : Colors.black, fontWeightDelta: 1),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
