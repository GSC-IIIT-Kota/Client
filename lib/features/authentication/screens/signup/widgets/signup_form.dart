import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: "Username",
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: "E-Mail",
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Phone number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: "Phone No.",
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          ///Signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Create Account"),
            ),
          ),
        ],
      ),
    );
  }
}