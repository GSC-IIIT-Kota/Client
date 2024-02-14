import 'package:flutter/material.dart';

class PCampaignCardTitle extends StatelessWidget {
  const PCampaignCardTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .apply(color: Colors.black, fontWeightDelta: 1),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
