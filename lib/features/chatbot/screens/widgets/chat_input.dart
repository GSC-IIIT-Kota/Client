import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PChatInput extends StatelessWidget {
  const PChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type message",
                contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 20), // Adjust the vertical padding
                suffixIcon: IconButton(
                  icon:const Icon(Iconsax.arrow_right5, size: 30, color: TColors.accent,),
                  onPressed: () {
                    // Handle send button press
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}