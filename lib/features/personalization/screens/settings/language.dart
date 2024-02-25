import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/utils/translator/strings_ar.dart' as ar;
import 'package:solution_challenge/utils/translator/strings_de.dart' as de;
import 'package:solution_challenge/utils/translator/strings_en.dart' as en;
import 'package:solution_challenge/utils/translator/strings_es.dart' as es;
import 'package:solution_challenge/utils/translator/strings_fr.dart' as fr;
import 'package:solution_challenge/utils/translator/strings_hi.dart' as hi;
import 'package:solution_challenge/utils/translator/strings_ja.dart' as ja;
import 'package:solution_challenge/utils/translator/strings_ko.dart' as ko;
import 'package:solution_challenge/utils/translator/strings_pt.dart' as pt;
import 'package:solution_challenge/utils/translator/strings_ru.dart' as ru;

import '../../../authentication/screens/onboarding/onboarding.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String selectedLanguage;
  late String language;

  @override
  void initState() {
    super.initState();
    selectedLanguage = '';
    language = "en"; // Default language
  }

  void selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
      this.language = language;
    });
  }

  List<String> getTranslatedStrings() {
    switch (language) {
      case 'en':
        return en.originalStrings;
      case 'hi':
        return hi.originalStrings;
      case 'es':
        return es.originalStrings;
      case 'de':
        return de.originalStrings;
      case 'fr':
        return fr.originalStrings;
      case 'ru':
        return ru.originalStrings;
      case 'ko':
        return ko.originalStrings;
      case 'ja':
        return ja.originalStrings;
      case 'pt':
        return pt.originalStrings;
      case 'ar':
        return ar.originalStrings;
      default:
        return en.originalStrings; // Default to English
    }
  }


  @override
  Widget build(BuildContext context) {
    translatedStrings = getTranslatedStrings();
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PAppBar(showBackArrow: true, backArrowColor: dark ? Colors.white : Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translatedStrings?[133] ?? 'Choose language',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                translatedStrings?[134] ?? 'Select the Language That Best Suits Your Preferences',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  _buildLanguageRow(['en', 'hi']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['es', 'de']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['fr', 'ru']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['pt', 'ja']),
                  const SizedBox(height: TSizes.gridViewSpacing),
                  _buildLanguageRow(['ko']),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
            );
          },
          child: Text(translatedStrings?[32] ?? 'Continue'),
        ),
      ),
    );
  }

  Widget _buildLanguageRow(List<String> languages) {
    return Row(
      children: languages
          .map(
            (language) => Expanded(
          child: GestureDetector(
            onTap: () {
              selectLanguage(language);
            },
            child: PLanguageTile(
              language: language,
              isSelected: selectedLanguage == language,
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}

class PLanguageTile extends StatelessWidget {
  const PLanguageTile({
    super.key,
    required this.language,
    required this.isSelected,
  });

  String getLanguage(String language) {
    switch (this.language) {
      case 'en':
        return 'English';
      case 'hi':
        return 'Hindi';
      case 'es':
        return 'Spanish';
      case 'de':
        return 'German';
      case 'fr':
        return 'French';
      case 'ru':
        return 'Russian';
      case 'ko':
        return 'Korean';
      case 'ja':
        return 'Japanese';
      case 'pt':
        return 'Portuguese';
      case 'ar':
        return 'Arabic';
      default:
        return 'English'; // Default to English
    }
  }

  final String language;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return PRoundedContainer(
      height: 56,
      padding: const EdgeInsets.only(left: TSizes.md),
      showBorder: true,
      borderColor: isSelected ? TColors.rani : TColors.dimgrey,
      backgroundColor: isSelected ? TColors.rani.withOpacity(0.2) : Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getLanguage(language),
            style: Theme.of(context).textTheme.titleLarge!.apply(
              color: isSelected ? TColors.rani : (dark ? Colors.white : Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
