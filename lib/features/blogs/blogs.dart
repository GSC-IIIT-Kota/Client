import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/white_search_container.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
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
