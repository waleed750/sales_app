import '../../core_export.dart';

extension LanguageTypeExtension on LanguageType {
  String getStringValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return LanguageType.ENGLISH.name;
      case LanguageType.ARABIC:
        return LanguageType.ARABIC.name;
    }
  }

  Locale getLocale() {
    switch (this) {
      case LanguageType.ENGLISH:
        return Locale('en');
      case LanguageType.ARABIC:
        return Locale('ar');
    }
  }
}

