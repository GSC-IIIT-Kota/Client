import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PBlogProfile extends StatelessWidget {
  const PBlogProfile(
      {super.key,
      required this.blogImage,
      required this.blogCategory,
      required this.blogDate,
      required this.blogTitle,
      required this.blogAuthor,
      required this.blogContent});

  final String blogImage;
  final String blogCategory;
  final String blogDate;
  final String blogTitle;
  final String blogAuthor;
  final String blogContent;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : TColors.dimgrey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.heart),
            color: TColors.brightpink,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              ///Image of article
              PRoundedImage(isNetworkImage: true, imageUrl: blogImage),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: TColors.rani,
                        iconSize: 14,
                        title: blogCategory,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.rani)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Reading time and posted when
                    Row(
                      children: [
                        Text('Uploaded on: $blogDate',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.battleship)),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Title
                    Text(
                      blogTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Author Name
                    PRoundedContainer(
                      borderColor: TColors.rani,
                      backgroundColor: TColors.rani,
                      child: PCardIconText(
                        iconData: Iconsax.user,
                        title: blogAuthor,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Content
                    Text(
                      blogContent,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.8)
                                : TColors.dimgrey,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
