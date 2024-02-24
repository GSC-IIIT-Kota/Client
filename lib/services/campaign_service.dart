import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/campaign.dart';

class CampaignService {
  static final baseUrl = dotenv.env['API_BASE_URL']; // Replace with your API base URL

  static Future<void> createCampaign(Campaign campaign) async {
    final url = Uri.parse('$baseUrl/campaigns/');
    final response = await http.post(
      url,
      body: json.encode(campaign.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create campaign');
    }
  }

  static Future<Campaign> getCampaignById(String id) async {
    final url = Uri.parse('$baseUrl/campaigns/$id');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to get campaign');
    }

    final Map<String, dynamic> data = json.decode(response.body);
    return Campaign.fromJson(data);
  }

  static Future<List<Campaign>> getAllCampaigns() async {
    final url = Uri.parse('$baseUrl/campaigns/');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to get campaigns');
    }

    final List<dynamic> dataList = json.decode(response.body);
    return dataList.map((data) => Campaign.fromJson(data)).toList();
  }

  static Future<void> updateCampaign(String id, Map<String, dynamic> updatedFields) async {
    final url = Uri.parse('$baseUrl/campaigns/$id');
    final response = await http.put(
      url,
      body: json.encode(updatedFields),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update campaign');
    }
  }

  static Future<void> updateCampaignImage(String id, String imageUrl) async {
    final url = Uri.parse('$baseUrl/campaigns/$id/update-image');
    final response = await http.patch(
      url,
      body: json.encode({'ImageURL': imageUrl}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update campaign image');
    }
  }

  static Future<void> deleteCampaign(String id) async {
    final url = Uri.parse('$baseUrl/campaigns/$id');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete campaign');
    }
  }
}
