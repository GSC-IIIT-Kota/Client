
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../password_configurations/forgot_password.dart';
import '../../signup/signup.dart';
import 'package:solution_challenge/services/user_service.dart';

class TLoginForm extends StatelessWidget {
    TLoginForm({super.key});

  final UserService userService = UserService();

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
                  userService.signIn(context, email, password);
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
