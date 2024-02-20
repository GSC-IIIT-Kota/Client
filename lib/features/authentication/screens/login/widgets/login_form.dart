// Import necessary packages
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../password_configurations/forgot_password.dart';
import '../../signup/signup.dart';
import '../../../../../services/user_service.dart';

// Your existing login form widget
class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  // Define method to handle sign in button pressed
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
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: translatedStrings?[7] ?? "E-Mail",
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password TextFormField
            TextFormField(
              controller: passwordController,
              obscureText: true, // Hide the password
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: translatedStrings?[8] ?? "Password",
                suffixIcon: const Icon(Iconsax.eye_slash),
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
                    Text(translatedStrings?[9] ?? "Remember me"),
                  ],
                ),
                // Forgot password TextButton
                TextButton(
                  onPressed: () {
                    // Navigate to ForgotPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPassword()),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: TColors.rani),
                  child: Text(translatedStrings?[10] ?? "Forgot Password?"),
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
                  UserService().signIn(context, email, password);
                },
                child: Text(translatedStrings?[11] ?? "Sign In"),
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
                child: Text(translatedStrings?[12] ?? "Create Account",),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
