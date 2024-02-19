import 'package:translator/translator.dart';
import 'package:solution_challenge/utils/translator/strings_en.dart';

class StringTranslator {
  late final GoogleTranslator translator; // Initialize the translator
  List<String> inputList = originalStrings;
  late List<String> translatedList; // Variable to store translated strings

  StringTranslator() {
    // Initialize the translator
    translator = GoogleTranslator();
    translatedList = List<String>.filled(inputList.length, ''); // Initialize with empty strings
  }

  // Method to translate a list of strings to a specified language
  Future<List<String>> translateList(String toLanguage) async {
    List<String> translatedList = [];

    // Translate each string in the input list
    for (String input in inputList) {
      Translation translation = await translator.translate(
        input,
        to: toLanguage,
      );
      translatedList.add(translation.text);
    }
    return translatedList;
  }
}
