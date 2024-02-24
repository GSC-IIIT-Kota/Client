import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/blog.dart';

class UserAccount {
  final apiBaseUrl = dotenv.env['API_BASE_URL'];

  Future<void> addToFavouritesArticles(String userId, String articleId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/favourite-article');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'articleId': articleId.toString()
        }), // Encode articleId as a string
      );

      if (response.statusCode == 200) {
        // Article added successfully
      } else {
        throw Exception('Failed to add article to favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<void> removeFromFavouritesArticles(
      String userId, String articleId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/favourite-article');

      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'articleId': articleId}),
      );

      if (response.statusCode == 200) {
        // Article removed successfully
      } else {
        throw Exception('Failed to remove article from favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<void> addToFavouriteBlogs(String userId, String blogId) async {
    try {
      String baseUrl = '$apiBaseUrl';
      final url = Uri.parse('$baseUrl/users/$userId/favourite-blog?blogId=$blogId');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'blogId': blogId}),
      );

      if (response.statusCode == 200) {
        // Blog added successfully
        print('Blog added to favourites successfully');
      } else {
        throw Exception('Failed to add blog to favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<void> removeFromFavouriteBlogs(String userId, String blogId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/favourite-blog');

      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'blogId': blogId}),
      );

      if (response.statusCode == 200) {
        // Blog removed successfully
      } else {
        throw Exception('Failed to remove blog from favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<void> addToFavouriteVideos(String userId, String videoId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/favourite-video');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'videoId': videoId}),
      );

      if (response.statusCode == 200) {
        // Video added successfully
      } else {
        throw Exception('Failed to add video to favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<void> removeFromFavouriteVideos(String userId, String videoId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/favourite-video');

      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'videoId': videoId}),
      );

      if (response.statusCode == 200) {
        // Video removed successfully
      } else {
        throw Exception('Failed to remove video from favourites');
      }
    } catch (error) {
      print('Error occurred: $error');
      // Handle error
    }
  }

  Future<List<Blog>> getUserBlogs(String userId) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/$userId/blogs');

      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<Blog> blogs = jsonData.map((data) => Blog.fromJson(data)).toList();
        return blogs;
      } else {
        throw Exception('Failed to get user blogs');
      }
    } catch (error) {
      print('Error occurred: $error');
      throw error; // Re-throw the error to handle it in the calling code
    }
  }
}
