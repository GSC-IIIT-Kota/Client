import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_bubble.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_input.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PPrimaryNgoContainer(
            child: Padding(
              padding: const EdgeInsets.only(bottom: TSizes.defaultSpace),
              child: PAppBar(
                title: ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(TImages.paddyAvatar),
                  ),
                  title: Text(
                    'Chat with Paddy',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text('Today'),
          Expanded(
            child: ListView(
              reverse: true, // To start at the bottom
              padding: const EdgeInsets.all(TSizes.md),
              children: const [
                // Example sent message
                PChatBubble(
                  message: 'Hi! Umm what are periods?',
                  isMe: true,
                ),

                // Example received message
                PChatBubble(
                  message:
                      'Hey! I am Paddy, Nice to see you. You can ask me anything you like!',
                  isMe: false,
                ),
                // Add more messages as needed
              ],
            ),
          ),
          const PChatInput(),
        ],
      ),
    );
  }
}
