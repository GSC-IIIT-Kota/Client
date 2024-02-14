// Import necessary packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../password_configurations/forgot_password.dart';
import '../../signup/signup.dart';

// Your existing login form widget
class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  // Define method to handle sign in button pressed
  Future<void> _signIn(BuildContext context, String email, String password) async {
    try {
      // Construct the URL for your backend's login endpoint
      final url = Uri.parse('http://192.168.137.1:8000/api/users/login'); // Update the URL with your server's login endpoint

      // Send a POST request with the user's credentials
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // Encode the user's email and password as JSON
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // If the login was successful, navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()),
        );
      } else {
        // If the login failed, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    } catch (error) {
      // Handle any errors that occur during the HTTP request
      print('Error occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // TextEditingController for email and password fields
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email TextFormField
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "E-Mail",
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password TextFormField
            TextFormField(
              controller: passwordController,
              obscureText: true, // Hide the password
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember me & Forgot password Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: true, // Placeholder value, replace with actual functionality
                      onChanged: (value) {}, // Placeholder function, replace with actual functionality
                    ),
                    const Text("Remember me"),
                  ],
                ),
                // Forgot password TextButton
                TextButton(
                  onPressed: () {
                    // Navigate to ForgotPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: TColors.rani),
                  child: const Text("Forgot Password?"),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Sign In ElevatedButton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Get the entered email and password
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  // Call the _signIn method to handle sign in
                  _signIn(context, email, password);
                },
                child: const Text("Sign In"),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account OutlinedButton
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Navigate to SignupScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: const Text("Create Account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
