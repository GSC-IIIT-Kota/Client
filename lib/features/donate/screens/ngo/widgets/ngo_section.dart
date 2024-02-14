import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/ngo/ngo_card.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PNgoSection extends StatelessWidget {
  const PNgoSection({
    super.key,
    required this.sectionHeading,
  });

  final String sectionHeading;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        PSectionHeading(
            title: sectionHeading,
            textColor: dark ? Colors.white : Colors.black),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return const PNgoCard(
                  title: "Help these kids get money to study",
                  description:
                      "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                  raisedMoney: 2000,
                  totalGoal: 4000,
                  imageUrl: TImages.banner1Image,
                  orgPhoto: 'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                  );
            },
          ),
        ),
      ],
    );
  }
}
