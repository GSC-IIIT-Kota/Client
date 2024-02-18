import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PNgoCategories extends StatelessWidget {
  const PNgoCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          /// Heading
          PSectionHeading(
            title: translatedStrings?[35] ?? "Categories",
            showActionButton: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return PVerticalImageText(
                  image: TImages.eventsIcon,
                  title: translatedStrings?[35] ?? "Categories",
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
