import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/models/campaign.dart';

class CampaignService {
  static Future<List<Campaign>> getAllCampaigns() async {

    final apiBaseUrl = dotenv.env['API_BASE_URL'];
    // Replace this URL with your actual API endpoint
    String apiUrl = '$apiBaseUrl/campaigns';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Campaign.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load campaigns');
      }
    } catch (e) {
      throw Exception('Failed to load campaigns: $e');
    }
  }

// Add more functions as needed, e.g., for creating, updating, or deleting campaigns
}
