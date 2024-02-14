import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/helpers/tts_manager.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TTSManager().flutterTts.setCompletionHandler(() {
    // Handle completion if needed
  });
  runApp(const App());
}
