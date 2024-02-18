import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/organisation.dart';
class NGOService {

  final apiBaseUrl = dotenv.env['API_BASE_URL'];

  Future<void> signupNGO(String email, String password, String ngoName) async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse('$baseUrl/signup');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'profile': jsonEncode(<String, String>{
            'ngoName': ngoName,
          }),
        }),
      );

      if (response.statusCode == 201) {
        // Signup successful
        print('NGO signed up successfully');
      } else {
        // Signup failed
        print('Failed to sign up NGO');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }

  Future<void> loginNGO(String email, String password) async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse('$baseUrl/login');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Login successful
        print('NGO logged in successfully');
      } else {
        // Login failed
        print('Failed to log in NGO');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }

  Future<NGO> getNGOById(String id) async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse('$baseUrl/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return NGO.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to get NGO by ID');
      }
    } catch (error) {
      print('An error occurred: $error');
      rethrow;
    }
  }

  Future<List<NGO>> getAllNGOs() async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse(baseUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => NGO.fromJson(e)).toList();
      } else {
        throw Exception('Failed to get all NGOs');
      }
    } catch (error) {
      print('An error occurred: $error');
      rethrow;
    }
  }

  Future<void> updateNGO(String id, Map<String, dynamic> updatedFields) async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse('$baseUrl/$id');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updatedFields),
      );

      if (response.statusCode == 200) {
        print('NGO updated successfully');
      } else {
        throw Exception('Failed to update NGO');
      }
    } catch (error) {
      print('An error occurred: $error');
      rethrow;
    }
  }

  Future<void> deleteNGO(String id) async {
    try {
      final baseUrl = '$apiBaseUrl/ngos';
      final url = Uri.parse('$baseUrl/$id');
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print('NGO deleted successfully');
      } else {
        throw Exception('Failed to delete NGO');
      }
    } catch (error) {
      print('An error occurred: $error');
      rethrow;
    }
  }
}
