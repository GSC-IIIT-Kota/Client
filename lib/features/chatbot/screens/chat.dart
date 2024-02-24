import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_bubble.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_input.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/tts_manager.dart';
import 'package:solution_challenge/features/chatbot/screens/prompt.dart';
import '../../authentication/screens/signup/widgets/typingIndicator.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TTSManager ttsManager = TTSManager();
  bool isTyping = false;
  bool messageSent = false;
  bool isWaitingForResponse = false; // Add this variable
  TextEditingController messageController = TextEditingController();
  List<String> chatMessages = [];
  List<Map<String, dynamic>> contents = [];
  String promptContent = prompt;

  @override
  void initState() {
    super.initState();
    contents.add({
      "role": "user",
      "parts": [
        {"text": promptContent}
      ]
    });
    contents.add({
      "role": "model",
      "parts": [
        {"text": "OK"}
      ]
    });
  }

  Future<dynamic> sendMessage(String message) async {
    setState(() {
      chatMessages.add(message);
      contents.add({
        "role": "user",
        "parts": [
          {"text": message}
        ]
      });
      messageSent = true;
      isTyping = true;
      isWaitingForResponse =
          true; // Set the flag to true when sending a message
    });

    final apiBaseUrl = dotenv.env['API_BASE_URL'];

    var response = await http.post(
      Uri.parse('$apiBaseUrl/chatbot/'),
      body: json.encode({"contents": contents}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      if (responseBody != null && responseBody['text'] != null) {
        setState(() {
          chatMessages.add(responseBody['text']);
          contents.add({
            "role": "model",
            "parts": [
              {"text": responseBody['text']}
            ]
          });
          isTyping = false;
          isWaitingForResponse =
              false; // Reset the flag when response is received
        });
      }
    } else {
      print('Failed to fetch response from server.');
    }
    print(contents);
  }

  void speak() {
    if (!isTyping) {
      String lastMessage = chatMessages.isNotEmpty ? chatMessages.last : '';
      ttsManager.speak(lastMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PPrimaryNgoContainer(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  Row(
                    children: [
                      /// User Avatar
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(TImages.paddyAvatar),
                      ),

                      /// Title and subtitle
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.spaceBtwItems),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Chat with Paddy',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .apply(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                ],
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
                if (isTyping ||
                    isWaitingForResponse) // Check the flag to disable input
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.transparent,
                      // Adjust the background color as needed
                      child: const TypingIndicator(),
                    ),
                  ),
              ],
            ),
          ),
          PChatInput(
            onSendMessage: isWaitingForResponse ? null : sendMessage,
            // Disable input if waiting for response
            onSpeak: speak,
          ),
        ],
      ),
    );
  }
}
