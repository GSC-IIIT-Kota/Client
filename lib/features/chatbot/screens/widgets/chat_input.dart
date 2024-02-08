import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PChatInput extends StatelessWidget {
  final Function(String) onSendMessage; // Define a callback function

  const PChatInput({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    TextEditingController messageController = TextEditingController();

    return Container(
      padding: const EdgeInsets.only(right: TSizes.md, left: TSizes.md, bottom: TSizes.md),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: "Type message",
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20), // Adjust the vertical padding
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Iconsax.arrow_right5,
              size: 30,
              color: dark ? TColors.accent : TColors.rani,
            ),
            onPressed: () {
              // Call onSendMessage callback with the message entered by the user
              String message = messageController.text.trim();
              if (message.isNotEmpty) {
                onSendMessage(message);
                messageController.clear(); // Clear the text field after sending the message
              }
            },
          ),
        ],
      ),
    );
  }
}
