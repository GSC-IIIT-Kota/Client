import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PWhiteSearchContainer extends StatelessWidget {
  const PWhiteSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: const Icon(Iconsax.search_normal),
          errorMaxLines: 3,
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,

          labelStyle:
              const TextStyle().copyWith(fontSize: 14, color: Colors.white),
          hintStyle:
              const TextStyle().copyWith(fontSize: 14, color: Colors.white),
          errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
          floatingLabelStyle:
              const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
          border: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(width: 1, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
