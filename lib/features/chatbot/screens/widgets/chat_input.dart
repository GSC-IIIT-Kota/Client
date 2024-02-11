import 'package:flutter/material.dart';
class PChatInput extends StatefulWidget {
  final Function(String) onSendMessage; // Callback function to send messages

  const PChatInput({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  State<PChatInput> createState() => _PChatInputState();
}

class _PChatInputState extends State<PChatInput> {
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: "Type message",
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String message = messageController.text.trim();
              if (message.isNotEmpty) {
                widget.onSendMessage(message); // Call the callback function with the message
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
