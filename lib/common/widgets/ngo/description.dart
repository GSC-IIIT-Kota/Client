import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final bool showFullDescription;
  final VoidCallback onReadMorePressed;

  const DescriptionWidget({
    super.key,
    required this.description,
    required this.showFullDescription,
    required this.onReadMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.titleSmall!.apply(
            color: dark ? TColors.brightpink : TColors.burgandy,
            fontWeightDelta: 2,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Text(
          showFullDescription ? description : '${description.substring(0, 100)}...',
          style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: dark
                ? Colors.white.withOpacity(0.8)
                : TColors.dimgrey,
          ),
        ),
        if (!showFullDescription)
          TextButton(
            onPressed: onReadMorePressed,
            child: Text(
              'Read more',
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
