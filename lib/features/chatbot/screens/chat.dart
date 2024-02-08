import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_bubble.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_input.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> chatMessages = [];

  late String apiUrl = 'http://localhost:8000/api/chatbot/'; // Initialize with default value

  @override
  void initState() {
    super.initState();
    loadEnv(); // Load environment variables when the widget initializes
  }

  Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env"); // Load environment variables from .env file
    setState(() {
      apiUrl = dotenv.env['API_BASE_URL'] ?? apiUrl; // Update apiUrl with value from .env file, or keep default value
    });
  }

  void sendMessage(String message) async {
    // Add user message to the chatMessages list
    setState(() {
      chatMessages.add(message);
    });

    // Make an API call to send the user message and get the response
    var response = await http.post(
      Uri.parse("$apiUrl/chatbot/"), // Use apiUrl variable
      body: json.encode({'inputText': message}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // If the request is successful, add the response to the chatMessages list
      setState(() {
        chatMessages.add(json.decode(response.body)['text']);
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
          const SizedBox(height: TSizes.spaceBtwItems),
          const Text('Today'),
          Expanded(
            child: ListView.builder(
              reverse: true, // To start at the bottom
              padding: const EdgeInsets.all(TSizes.md),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return PChatBubble(
                  message: chatMessages[index],
                  isMe: index % 2 == 0, // Alternating sender and receiver
                );
              },
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
