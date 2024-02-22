import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/features/personalization/screens/profile/profile.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PUserProfileTile extends StatelessWidget {
  const PUserProfileTile({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subTitle,
    this.showEditIcon = false,
    this.textColor = Colors.white,
    required this.showSubtitle,
  });

  final String imageUrl;
  final String title;
  final bool showSubtitle;
  final String? subTitle;
  final bool showEditIcon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PHelperFunctions.screenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              /// User Avatar
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(imageUrl),
              ),

              /// Title and subtitle
              Padding(
                padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: textColor)),
                    if (showSubtitle)
                      const SizedBox(
                        height: TSizes.sm / 2,
                      ),
                    Text(
                      subTitle!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: textColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Edit Profile icon
          if (showEditIcon)
            IconButton(
              onPressed: () => Get.to(() => const ProfileScreen()),
              icon: const Icon(
                Iconsax.edit,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
