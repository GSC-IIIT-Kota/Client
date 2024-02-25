import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:solution_challenge/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/personalization/screens/settings/favourite_blogs.dart';
import 'package:solution_challenge/features/personalization/screens/settings/language.dart';
import 'package:solution_challenge/features/personalization/screens/settings/liked_videos.dart';
import 'package:solution_challenge/features/personalization/screens/settings/my_blogs.dart';
import 'package:solution_challenge/features/personalization/screens/settings/my_donations.dart';
import 'package:solution_challenge/features/personalization/screens/settings/registered_events.dart';
import 'package:solution_challenge/features/personalization/screens/settings/starred_articles.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

import '../../../../utils/provider/userProvider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final userFirstName = user?.profile.firstName ?? "";
    // print(userFirstName);
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  ///AppBar
                  PAppBar(
                    title: Text(
                      translatedStrings?[52] ?? "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),

                  ///User Profile
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace,
                        vertical: TSizes.spaceBtwItems),
                    child: PUserProfileTile(
                      subTitle: user!.email,
                      imageUrl: user.profile.profileImage,
                      title: "$userFirstName ${user.profile.lastName}",
                      showEditIcon: true,
                      showSubtitle: true,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  PSectionHeading(
                    title: translatedStrings?[53] ?? 'Account Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const MyBlogsScreen()),
                      icon: Iconsax.path,
                      title: translatedStrings?[56] ?? "My Blogs",
                      subTitle: translatedStrings?[138] ?? "Explore Your Written Insights"),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const FavouriteBlogsScreen()),
                      icon: Iconsax.heart,
                      title: translatedStrings?[132] ?? "Favorite Blogs",
                      subTitle: "Curate Your Preferred Reads"),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const MyDonationsScreen()),
                      icon: Iconsax.receipt,
                      title: translatedStrings?[55] ?? "My Donations",
                      subTitle:
                          translatedStrings?[59] ?? "Track your contributions"),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const RegisteredEventsScreen()),
                      icon: Iconsax.bubble,
                      title: translatedStrings?[137] ?? "Registered Events",
                      subTitle: translatedStrings?[140] ?? "Stay Updated on Your Engagements"),

                  PSettingsMenuTile(
                    onTap: () => Get.to(() => const StarredArticlesScreen()),
                    icon: Iconsax.star,
                    title: translatedStrings?[141] ?? "Starred Articles",
                    subTitle: translatedStrings?[142] ?? "Access Your Starred Reads",
                  ),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const LikedVideosScreen()),
                      icon: Iconsax.like_1,
                      title: translatedStrings?[135] ?? "Liked Videos",
                      subTitle: translatedStrings?[143] ?? "Keep Your Preferred Videos Handy"),

                  ///App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSectionHeading(
                    title: translatedStrings?[64] ?? 'App Settings',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSettingsMenuTile(
                      onTap: () => Get.to(() => const LanguageScreen()),
                      icon: Iconsax.translate,
                      title: translatedStrings?[65] ?? "Change language",
                      subTitle: translatedStrings?[66] ??
                          "Tailor your experience with a language switch")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Liked Videos --? like
/// Saved articles --> star
/// Favourite Blogs --> heart
/// My donations
/// My Blogs
