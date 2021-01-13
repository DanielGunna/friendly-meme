import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_USER_LOGGED_KEY = 'user_logged';
const String PREFS_USER_ID_KEY = 'current_user_id';

Future<SharedPreferences> getSharedPreferences() async {
  return await SharedPreferences.getInstance();
}
