import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/login_signup/form_divider.dart';
import 'package:solution_challenge/common/widgets/login_signup/social_buttons.dart';
import 'package:solution_challenge/features/authentication/screens/signup/verify_email.dart';
import 'package:solution_challenge/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:http/http.dart' as http;
class SignupScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleSignupPressed() async {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String password = _passwordController.text;

    // Make a POST request to your backend API
    // final Uri url = Uri.parse('http://192.168.137.1:8000/api/users/signup');
    Map<String, dynamic> requestBody = {
      "profile": {
        'firstName': firstName,
        'lastName': lastName
      },
      "email": email,
      "password": password,
    };

    String encodedBody = jsonEncode(requestBody);

    final response = await http.post(
      Uri.parse('http://192.168.137.1:8000/api/users/signup'),
      headers: {
        "Content-Type": "application/json",
      },
      body: encodedBody,
    );

    if (response.statusCode == 201) {
      // Signup successful, handle the response as needed
      print('Signup successful');
    } else {
      // Signup failed, handle the error
      print('Signup failed: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                translatedStrings?[27] ?? "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Form
              TSignupForm(
                firstNameController: _firstNameController,
                lastNameController: _lastNameController,
                usernameController: _usernameController,
                emailController: _emailController,
                phoneNumberController: _phoneNumberController,
                passwordController: _passwordController,
                onSubmit: _handleSignupPressed,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Divider
              TFormDivider(dividerText: translatedStrings?[28] ?? "or sign up with".capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

