import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {

  Future<String> sendMessage(List<Map<String, dynamic>> contents) async {

    final apiBaseUrl = dotenv.env['API_BASE_URL'];

    final String baseUrl = '$apiBaseUrl/chatbot/';

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
