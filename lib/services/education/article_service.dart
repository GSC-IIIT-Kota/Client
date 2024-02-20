import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/education/articles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ArticleService {
  static final baseUrl = dotenv.env['API_BASE_URL']; // Update with your server URL

  static Future<void> createArticle(Article article) async {
    final response = await http.post(
      Uri.parse('$baseUrl/articles'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(article.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create article: ${response.body}');
    }
  }

  static Future<Article> getArticle(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/articles/$id'));

    if (response.statusCode == 200) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get article: ${response.body}');
    }
  }

  static Future<List<Article>> getAllArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/articles'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get articles: ${response.body}');
    }
  }

  static Future<void> updateArticle(Article article) async {
    final response = await http.put(
      Uri.parse('$baseUrl/articles/${article.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(article.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update article: ${response.body}');
    }
  }

  static Future<void> deleteArticle(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/articles/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete article: ${response.body}');
    }
  }

  static Future<void> addComment(String articleId, Comment comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/articles/$articleId/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(comment.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add comment: ${response.body}');
    }
  }

  static Future<void> removeComment(String articleId, String commentId) async {
    final response = await http.delete(Uri.parse('$baseUrl/articles/$articleId/comments?commentID=$commentId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to remove comment: ${response.body}');
    }
  }
}