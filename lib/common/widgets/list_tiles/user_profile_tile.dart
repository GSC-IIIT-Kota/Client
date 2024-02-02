import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PUserProfileTile extends StatelessWidget {
  const PUserProfileTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.showEditIcon = false,
  });

  final String imageUrl;
  final String title;
  final String subTitle;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white)),
        subtitle: Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ),
        trailing: showEditIcon
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.edit,
                  color: Colors.white,
                ))
            : null);
  }
}
