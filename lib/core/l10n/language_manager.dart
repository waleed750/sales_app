// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/core_export.dart';
import 'app_localizations.dart';

class AppStrings {
  static late AppLocalizations tr;
  static get(BuildContext context) => tr = AppLocalizations.of(context)!;
}

const String ARABIC = "ar";
const String ENGLISH = "en";
const Locale ARABIC_LOCAL = Locale(ARABIC, "SA");
const Locale ENGLISH_LOCAL = Locale(ENGLISH, "US");

class LanguageManager {
  final SharedPreferences sharedPreferences;

  LanguageManager({required this.sharedPreferences});
  Future<String> getAppLanguage() async {
    String? language = sharedPreferences.getString(AppPrefKey.PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return ENGLISH;
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getLocale().languageCode) {
      // return arabic local
      return ARABIC_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }
}
