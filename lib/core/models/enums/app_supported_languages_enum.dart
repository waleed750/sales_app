// ignore_for_file: constant_identifier_names


import '../../core_export.dart';

enum LanguageType { ENGLISH, ARABIC }



extension LocaleTypeExtension on String {
  static final map = {
    LanguageType.ENGLISH.name: Locale(
      'en',
    ),
    LanguageType.ARABIC.name: Locale(
      'ar',
    ),
  };

  
  Locale getLocale() {
    return map[this] ?? LanguageType.ENGLISH.getLocale();
  }
}

extension FromLocaleLanguageTypeExtension on Locale {
  LanguageType getLanguageType() {
    return LanguageType.values.firstWhere(
        (element) => element.getLocale().languageCode == languageCode);
  }
}

