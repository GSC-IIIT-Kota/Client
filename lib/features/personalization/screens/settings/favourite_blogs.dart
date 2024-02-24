import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';

import '../../../../utils/constants/sizes.dart';

class FavouriteBlogsScreen extends StatelessWidget {
  const FavouriteBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  ///Appbar
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      'Favorite Blogs',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.defaultSpace,),
            /// Blogs card Future Builder
          ],
        ),
      ),
    );
  }
}
