import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../navigation_menu.dart';
import '../utils/userPrefernces/userProvider.dart';

class UserService {

  final apiBaseUrl = dotenv.env['API_BASE_URL'];

  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/login');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        final user = User.fromJson(userData);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        print(Provider.of<UserProvider>(context, listen: false).hashCode);
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        print(userData);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    } catch (error) {
      print('Error occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  Future<void> signUp(BuildContext context, Map<String, dynamic> userData) async {
    try {
      String baseUrl = '$apiBaseUrl/users';
      final url = Uri.parse('$baseUrl/signup');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        final newUser = User.fromJson(jsonDecode(response.body));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu()),
        );
      } else if (response.statusCode == 400) {
        throw Exception('User with this email already exists');
      } else {
        throw Exception('Failed to signup user');
      }
    } catch (error) {
      print('Error occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }

  Future<dynamic> getUser(String userId) async {
    String baseUrl = '$apiBaseUrl/users';
    final response = await http.get(Uri.parse('$baseUrl/$userId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user');
    }
  }

  Future<List<dynamic>> getUsers() async {
    String baseUrl = '$apiBaseUrl/users';
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<dynamic> updateUser(String userId, Map<String, dynamic> updatedFields) async {
    String baseUrl = '$apiBaseUrl/users';
    final response = await http.put(
      Uri.parse('$baseUrl/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedFields),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<dynamic> deleteUser(String userId) async {
    String baseUrl = '$apiBaseUrl/users';
    final response = await http.delete(Uri.parse('$baseUrl/$userId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
