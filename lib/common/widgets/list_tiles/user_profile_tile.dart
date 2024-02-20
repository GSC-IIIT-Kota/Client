import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/features/personalization/screens/profile/profile.dart';
import 'package:get/get.dart';

class PUserProfileTile extends StatelessWidget {
  PUserProfileTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.showEditIcon = false,
    this.textColor = Colors.white,
  });

  final String imageUrl;
  final String title;
  final String subTitle;
  final bool showEditIcon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title.trim(), style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor)),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
      ),
      trailing: showEditIcon
          ? IconButton(
        onPressed: () => Get.to(() => const ProfileScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
      )
          : null,
    );
  }
}
