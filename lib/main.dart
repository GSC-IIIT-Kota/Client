import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_challenge/utils/helpers/tts_manager.dart';
import 'package:solution_challenge/utils/userPrefernces/userProvider.dart';
import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  TTSManager().flutterTts.setCompletionHandler(() {
    // Handle completion if needed
  });
  await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const App(),
    ),
  );
}
