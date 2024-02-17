import 'dart:convert';
import 'package:http/http.dart' as http;

class EventService {
  static const String baseUrl = 'http://192.168.137.1:8000/api/events';

  Future<List<dynamic>> getEvents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<dynamic> createEvent(Map<String, dynamic> eventData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(eventData),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create event');
    }
  }

  Future<dynamic> registerUserForEvent(String eventId, String userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$eventId/register?user=$userId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user for event');
    }
  }
}
