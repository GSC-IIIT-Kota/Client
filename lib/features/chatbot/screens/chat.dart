import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_bubble.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_input.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

import '../../authentication/screens/signup/widgets/typingIndicator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  bool messageSent = false;
  TextEditingController messageController = TextEditingController();
  List<String> chatMessages = [];

  Future<void> sendMessage(String message) async {
    // Add user message to the chatMessages list
    setState(() {
      chatMessages.add(message);
      messageSent = true;
      isTyping = true;
    });

    // Make a POST request to send the user message to the chatbot API
    var response = await http.post(
      Uri.parse('http://192.168.21.122:8000/api/chatbot/'),
      body: json.encode({"InputText": message}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // If the request is successful, add the response to the chatMessages list
      setState(() {
        chatMessages.add(json.decode(response.body)['text']);
        isTyping = false;
      });
    } else {
      // Handle error
      print('Failed to fetch response from server.');
    }
  }

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
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          const Text('Today'),
          const SizedBox(height: TSizes.spaceBtwItems),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final messageIndex = chatMessages.length - 1 - index;
                    return PChatBubble(
                      message: chatMessages[messageIndex],
                      isMe: messageIndex % 2 == 0,
                    );
                  },
                ),
                if (isTyping)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.transparent, // Adjust the background color as needed
                      child: TypingIndicator(),
                    ),
                  ),
              ],
            ),
          ),
          PChatInput(
            onSendMessage: sendMessage,
          ),
        ],
      ),
    );
  }
}
