import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PPeopleDonated extends StatelessWidget {
  const PPeopleDonated({
    Key? key,
    required this.userPhotos,
    required this.numberOfPeople,
  }) : super(key: key);

  final List<String> userPhotos; // List of image URLs
  final int numberOfPeople;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (int i = 0; i < userPhotos.length; i++)
              Transform.translate(
                offset: i == 0 ? Offset.zero : Offset(i * -10, 0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: TColors.burgandy, // Set border color
                      width: 2.0, // Set border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(userPhotos[i]),
                  ),
                ),
              ),
            Transform.translate(
              offset: const Offset(-10,0),
              child: Text(
                '$numberOfPeople+ donated',
                style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.accent : TColors.rani),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
