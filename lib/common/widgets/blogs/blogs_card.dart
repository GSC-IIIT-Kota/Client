import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/blogs/blogs_profile.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/icons/circular_star.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/campaign_card_title.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class PBlogCard extends StatelessWidget {
  const PBlogCard(
      {super.key,
      required this.cardWidth,
      this.bottomMargin,
      required this.imageUrl,
      required this.blogTitle,
      required this.blogAuthor,
      required this.blogDate,
      required this.blogCategory, required this.blogContent});

  final double cardWidth;
  final EdgeInsets? bottomMargin;
  final String imageUrl;
  final String blogTitle;
  final String blogCategory;
  final String blogAuthor;
  final String blogDate;
  final String blogContent;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => PBlogProfile(
            blogImage: imageUrl,
            blogCategory: blogCategory,
            blogDate: blogDate,
            blogTitle: blogTitle,
            blogAuthor: blogAuthor,
            blogContent: blogContent,
          )),
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(1),
        margin: bottomMargin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? Colors.black : Colors.white),
        child: Column(
          children: [
            ///Thumbnail, star button
            PRoundedContainer(
              backgroundColor: dark ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  ///Thumbnail
                  PRoundedImage(
                    isNetworkImage: true,
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                  ),

                  /// Favorite icon button
                  const Positioned(top: 5, right: 5, child: PCircularStar()),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.md,
                  top: TSizes.sm,
                  right: TSizes.md,
                  bottom: TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Title
                  PCampaignCardTitle(
                    title: blogTitle,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  ///Category
                  PCardIconText(
                    iconData: Iconsax.category,
                    iconSize: 18,
                    iconColor: dark ? TColors.brightpink : TColors.rani,
                    title: blogCategory,
                    titleStyle: Theme.of(context).textTheme.labelLarge!.apply(
                          color: dark ? TColors.brightpink : TColors.rani,
                        ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  ///Author
                  PCardIconText(
                    iconData: Iconsax.user,
                    iconSize: 18,
                    iconColor: TColors.rani,
                    title: blogAuthor,
                    titleStyle: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark
                            ? Colors.white.withOpacity(0.8)
                            : TColors.battleship,
                        fontWeightDelta: 2),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  ///Time ago
                  PCardIconText(
                    iconData: Iconsax.calendar,
                    iconSize: 18,
                    iconColor: TColors.rani,
                    title: blogDate,
                    titleStyle: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark
                            ? Colors.white.withOpacity(0.8)
                            : TColors.battleship,
                        fontWeightDelta: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
