import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';
class EventService {

  final apiBaseUrl = dotenv.env['API_BASE_URL'];
  Future<List<Event>> getEvents() async {
    final String baseUrl = '$apiBaseUrl/events';
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> eventData = jsonDecode(response.body);
      List<Event> events = eventData.map((e) => Event.fromJson(e)).toList();
      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<dynamic> createEvent(Map<String, dynamic> eventData) async {
    final String baseUrl = '$apiBaseUrl/events';
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
    final String baseUrl = '$apiBaseUrl/events';
    final response = await http.post(
      Uri.parse('$baseUrl/$eventId/register?user=$userId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register user for event');
    }
  }

  Future<dynamic> getEventById(String eventId) async {
    final String baseUrl = '$apiBaseUrl/events';
    final response = await http.get(Uri.parse('$baseUrl/$eventId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load event');
    }
  }

  Future<dynamic> updateEvent(String eventId, Map<String, dynamic> updatedEventData) async {
    final String baseUrl = '$apiBaseUrl/events';
    final response = await http.put(
      Uri.parse('$baseUrl/$eventId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedEventData),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update event');
    }
  }

  Future<dynamic> deleteEvent(String eventId) async {
    final String baseUrl = '$apiBaseUrl/events';
    final response = await http.delete(Uri.parse('$baseUrl/$eventId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete event');
    }
  }
}
