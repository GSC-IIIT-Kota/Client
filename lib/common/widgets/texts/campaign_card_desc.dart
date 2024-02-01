import 'package:flutter/material.dart';

class PCampaignCardDesc extends StatelessWidget {
  const PCampaignCardDesc({
    super.key, required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}