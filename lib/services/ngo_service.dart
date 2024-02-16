import 'dart:convert';
import 'package:http/http.dart' as http;

class NGO {
  final String id;
  final String name;
  final String email;
  final String passwordHash;

  NGO({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
  });

  factory NGO.fromJson(Map<String, dynamic> json) {
    return NGO(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      passwordHash: json['passwordHash'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'passwordHash': passwordHash,
    };
  }
}

class NGOService {
  static const baseUrl = 'http://192.168.137.1:8000/api/ngos'; // Update the URL with your server's NGO endpoint

  static Future<void> signupNGO(String email, String password, String ngoName) async {
    try {
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

  static Future<void> loginNGO(String email, String password) async {
    try {
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

  static Future<NGO> getNGOById(String id) async {
    try {
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

  static Future<List<NGO>> getAllNGOs() async {
    try {
      final url = Uri.parse('$baseUrl');
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

  static Future<void> updateNGO(String id, Map<String, dynamic> updatedFields) async {
    try {
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

  static Future<void> deleteNGO(String id) async {
    try {
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
