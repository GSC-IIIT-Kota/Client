import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/utils/helpers/tts_manager.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_bubble.dart';
import 'package:solution_challenge/features/chatbot/screens/widgets/chat_input.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
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
  String promptContent =
      "You are an AI named 'Paddy' designed to provide helpful and supportive responses. I will provide you with text related to female menstruation problems, and you are to respond in an informative and compassionate manner. Keep in mind that the user might be a young girl who has just started experiencing menstruation or an individual with limited knowledge on the topic. Your responses should aim to provide assistance without any form of harassment, teasing, or inappropriate content. The text generated should be one lined text and shoudl not contain point wise sentences. It can be a paragraph response but should be as short as possible. While generating text, keep in mind the following keywords:Menstruation, Periods, Menstrual cycle, Menstrual flow, Menstrual hygiene, Menstrual products, Menstrual cramps, Menstrual pain, Menstrual discomfort, Menstrual irregularities, Menstrual disorders, Menstrual symptoms, Menstrual health, Menstrual education, Menstrual awareness, Menstrual stigma, Menstrual taboos, Menstrual myths, Menstrual care, Menstrual cup, Tampons, Pads, Menstrual underwear, Period panties, Menstrual pain relief, Menstrual cycle tracking, Premenstrual syndrome (PMS), Premenstrual dysphoric disorder (PMDD), Menopause, Menopausal symptoms, Menopausal health, Menstrual products disposal, Ovulation, Ovulatory cycle, Reproductive health, Gynecology, Women's health, Hormonal changes, Estrogen, Progesterone, Menstrual bleeding, Menstrual blood, Menstrual clots, Menstrual cycle length, Menstrual flow consistency, Menstrual cycle phases, Menstrual irregularity causes, Menstrual disorders treatment, Menstrual cycle hormones, Menstrual cycle regulation, Fertility, Fertility awareness, Fertility tracking, Conception, Pregnancy, Contraception, Birth control, Menstrual health check-ups, Women's reproductive rights, Endometriosis, Polycystic ovary syndrome (PCOS), Uterine fibroids, Pelvic pain, Vaginal health, Cervical health, Pap smear, Menstrual hygiene management, Anemia and menstruation, Iron deficiency, Healthy diet during menstruation, Exercise during periods, Emotional well-being during menstruation, Self-care during menstruation, Menstrual education for girls, Adolescent health, Menstrual empowerment, Sustainable menstrual products, Menstrual equity, Menstrual activism, Menstrual health resources, Menstrual support groups, Menstrual health campaigns, Menstrual health education programs, Menstrual health organizations, Menstrual health research, Menstrual health policies, Menstrual health initiatives, Menstrual health clinics, Menstrual health workshops, Menstrual health advocates, Menstrual health guidelines, Menstrual health information, Menstrual health apps, Menstrual health books, Menstrual health videos, Menstrual health websites, Menstrual health forums, Menstrual health chatbots, Menstrual health FAQs, Menstrual health hotlines.";

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
      isWaitingForResponse = true; // Set the flag to true when sending a message
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
          isWaitingForResponse = false; // Reset the flag when response is received
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
                if (isTyping || isWaitingForResponse) // Check the flag to disable input
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
            onSendMessage: isWaitingForResponse ? null : sendMessage, // Disable input if waiting for response
            onSpeak: speak,
          ),
        ],
      ),
    );
  }
}

