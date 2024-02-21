import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:solution_challenge/models/education/video.dart';

class VideoService {
  static final baseUrl = dotenv.env['API_BASE_URL']; // Update with your server's base URL

  static Future<List<Video>> getVideos() async {
    final response = await http.get(Uri.parse('$baseUrl/videos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Video.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load videos: ${response.statusCode}');
    }
  }

  static Future<Video> getVideo(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/videos/$id'));
    if (response.statusCode == 200) {
      return Video.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load video');
    }
  }

  static Future<void> createVideo(Video video) async {
    final response = await http.post(
      Uri.parse('$baseUrl/videos'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(video.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create video');
    }
  }

  static Future<void> updateVideo(String id, Video video) async {
    final response = await http.put(
      Uri.parse('$baseUrl/videos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(video.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update video');
    }
  }

  static Future<void> deleteVideo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/videos/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete video');
    }
  }

  static Future<void> addCommentOnVideo(String id, Comment comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/videos/$id/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(comment.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add comment');
    }
  }

  static Future<void> removeCommentOnVideo(String id, String commentId) async {
    final response = await http.delete(Uri.parse('$baseUrl/videos/$id/comments?commentID=$commentId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove comment');
    }
  }

  static Future<void> likeVideo(String id) async {
    final response = await http.put(Uri.parse('$baseUrl/videos/$id/like'));
    if (response.statusCode != 200) {
      throw Exception('Failed to like video');
    }
  }
}
