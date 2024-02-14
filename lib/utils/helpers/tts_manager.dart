import 'package:flutter_tts/flutter_tts.dart';

class TTSManager {
  FlutterTts flutterTts = FlutterTts();
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;
  String language = "en-US";

  TTSManager() {
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(language);
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }
}
