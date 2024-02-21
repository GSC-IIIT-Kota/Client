import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Upload Image Outlined Button
            OutlinedButton.icon(
              onPressed: () {
                // Implement image upload functionality
              },
              icon: const Icon(Iconsax.image),
              label: const Text('Upload Image'),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Title Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                prefixIcon: Icon(Iconsax.text),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Description Input
            const TextField(
              maxLines: null, // Allow multiline input
              decoration: InputDecoration(
                labelText: 'Description',
                prefixIcon: Icon(Iconsax.textalign_left),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Create Blog'),
        ),
      ),
    );
  }
}
