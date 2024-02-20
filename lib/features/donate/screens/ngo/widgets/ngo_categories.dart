import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/common/widgets/viewall/viewall_cards.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:get/get.dart';

class PNgoCategories extends StatelessWidget {
  PNgoCategories({
    super.key,
  });

  final List<Map<String, dynamic>> categories = [
    {
      'name': "Campaigns",
      'icon': TImages.campaignsIcon,
    },
    {
      'name': "Organizations",
      'icon': TImages.charityIcon,
    },
    {
      'name': "Events",
      'icon': TImages.eventsIcon,
    },
  ];

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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                final String name = category['name'];
                final String icon = category['icon'];

                return PVerticalImageText(
                  image: icon,
                  title: name,
                  onTap: () => Get.to(() => PViewAllScreen(initiativeType: name)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
