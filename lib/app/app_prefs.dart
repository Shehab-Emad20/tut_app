import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app/utils/langauge_manger.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";

class AppPrefs {
  final SharedPreferences _sharedPreferences;
  AppPrefs(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LangaugeType.english.getValue();
    }
  }
}
