import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/blogs/blogs_card.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/white_search_container.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PPrimaryNgoContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///Appbar
                  PBlogAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///SearchBar
                  PWhiteSearchContainer(text: "Search Blogs"),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Section Heading
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PSectionHeading(
                    title: 'Latest Blogs',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  PBlogCard(
                    cardWidth: PHelperFunctions.screenWidth(),
                    bottomMargin:
                        const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                    imageUrl:
                        'https://st3.depositphotos.com/4218696/17786/i/1600/depositphotos_177869618-stock-photo-two-women-talking-about-problems.jpg',
                    blogTitle: 'Women talking about periods',
                    blogCategory: 'Menstrual Health',
                    blogAuthor: 'Yogit Nainani',
                    blogDate: '18/02/24',
                  ),
                  PBlogCard(
                    cardWidth: PHelperFunctions.screenWidth(),
                    bottomMargin:
                        const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                    imageUrl:
                        'https://st3.depositphotos.com/4218696/17786/i/1600/depositphotos_177869618-stock-photo-two-women-talking-about-problems.jpg',
                    blogTitle: 'Women talking about periods',
                    blogCategory: 'Menstrual Health',
                    blogAuthor: 'Yogit Nainani',
                    blogDate: '18/02/24',
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

class PBlogAppBar extends StatelessWidget {
  const PBlogAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How you doin'?",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.accent),
          ),
          Text(
            "Yogit",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: Colors.white),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.edit,
              color: Colors.white,
            ))
      ],
    );
  }
}
