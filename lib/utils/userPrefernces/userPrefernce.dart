import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserLogin() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', true);
}

Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}
