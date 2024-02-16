import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const String baseUrl = 'http://192.168.137.1:8000/api/chatbot/';

  Future<String> sendMessage(List<Map<String, dynamic>> contents) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      body: json.encode({"contents": contents}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      if (responseBody != null && responseBody['text'] != null) {
        return responseBody['text'];
      }
    } else {
      throw Exception('Failed to fetch response from server.');
    }
    return ''; // Return an empty string if there is no response
  }
}
