import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/styles/spacing_styles.dart';
import 'package:solution_challenge/common/widgets/login_signup/form_divider.dart';
import 'package:solution_challenge/common/widgets/login_signup/social_buttons.dart';
import 'package:solution_challenge/features/authentication/screens/login/widgets/login_form.dart';
import 'package:solution_challenge/features/authentication/screens/login/widgets/login_header.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo title & subtitle
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: translatedStrings?[15] ?? "Or Sign In with".capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}