import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.usernameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.onSubmit,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          /// First Name and Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: translatedStrings?[23] ?? "First Name",
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: translatedStrings?[24] ?? "Last Name",
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),


          /// username
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: translatedStrings?[25] ?? "Username",
              prefixIcon: const Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///email
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: translatedStrings?[7] ?? "E-Mail",
              prefixIcon: const Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Phone no
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              labelText: translatedStrings?[26] ?? "Phone No.",
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///password
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: translatedStrings?[8] ?? "Password",
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: const Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          ///button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(translatedStrings?[12] ?? "Create Account"),
            ),
          ),
        ],
      ),
    );
  }
}