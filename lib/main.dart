import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/utils/helpers/tts_manager.dart';
import 'package:solution_challenge/utils/provider/userProvider.dart';

import 'app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  TTSManager().flutterTts.setCompletionHandler(() {
    // Handle completion if needed
  });
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const App(),
    ),
  );
}
