// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core_export.dart';


class AppPrefKey {
  static const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
  static const String PREFS_KEY_ONBOARDING_SCREEN =
      "PREFS_KEY_ONBOARDING_SCREEN";
  static const String PREFS_KEY_IS_USER_LOGGED_IN =
      "PREFS_KEY_IS_USER_LOGGED_IN";
  static const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
  static const String PREFS_KEY_THEME = "PREFS_KEY_THEME";
  static const String PREFS_KEY_HISTORY = "PREFS_KEY_HISTORY_SEARCH";
  static const String PREFS_KEY_APPREVIEW_COUNT = "PREFS_KEY_APPREVIEW_COUNT";
  static const String PREFS_KEY_COURSE_DETAILS_COUNT = "PREFS_KEY_COURSE_DETAILS_COUNT";
  static const String PREFS_KEY_LAST_ON_APP_OPEN_ADD_DATE = "PREFS_KEY_LAST_ON_APP_OPEN_ADD_DATE";
  static const String PREFS_KEY_GDPR_ACCEPTED = "PREFS_KEY_GDPR_ACCEPTED";
}

class AppPreferences {
  static FlutterSecureStorage? _storage;

  AppPreferences();

  // Initializes the secure storage with platform-specific options.
  Future<void> init() async {
    final androidOptions = AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
        keyCipherAlgorithm: _toKeyCipher,
        storageCipherAlgorithm: _toStorageCipher,
        preferencesKeyPrefix: String.fromEnvironment(Environment.KY_PREFIX));

    const iosOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: true,
    );
    _storage = FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  // Storage Cipher Algorithm options
  static StorageCipherAlgorithm get _toStorageCipher {
    switch (String.fromEnvironment(Environment.KY_CIPHER)) {
      case 'AES_CBC_PKCS7Padding':
        return StorageCipherAlgorithm.AES_CBC_PKCS7Padding;
      case 'AES_GCM_NoPadding':
        return StorageCipherAlgorithm.AES_GCM_NoPadding;
      default:
        return StorageCipherAlgorithm.AES_CBC_PKCS7Padding;
    }
  }

  // Key Cipher Algorithm options
  static KeyCipherAlgorithm get _toKeyCipher {
    switch (String.fromEnvironment(Environment.KY_CIPHER)) {
      case 'AES_CBC_PKCS7Padding':
        return KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding;
      case 'AES_GCM_NoPadding':
        return KeyCipherAlgorithm.RSA_ECB_PKCS1Padding;
      default:
        return KeyCipherAlgorithm.RSA_ECB_PKCS1Padding;
    }
  }

  Future<String?> getAppLanguage() async {
    String? language = await _storage!.read(key: AppPrefKey.PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    }
    return null;
  }

  Future<void> setLanguageChanged(LanguageType language) async {
    await _storage!.write(
        key: AppPrefKey.PREFS_KEY_LANG, value: language.getStringValue());
  }

  Future<Locale?> getLocal() async {
    String? currentLanguage = await getAppLanguage();
    if (currentLanguage == null) return null;
    return currentLanguage.getLocale();
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _storage!
        .write(key: AppPrefKey.PREFS_KEY_ONBOARDING_SCREEN, value: 'true');
  }

  Future<bool> isOnBoardingScreenViewed() async {
    String? value =
        await _storage!.read(key: AppPrefKey.PREFS_KEY_ONBOARDING_SCREEN);
    return value == 'true';
  }

  Future<void> setUserToken(String token) async {
    await _storage!.write(key: AppPrefKey.PREFS_KEY_TOKEN, value: token);
  }

  Future<String> getUserToken() async {
    return await _storage!.read(key: AppPrefKey.PREFS_KEY_TOKEN) ?? '';
  }

  Future<void> setIsUserLoggedIn() async {
    await _storage!
        .write(key: AppPrefKey.PREFS_KEY_IS_USER_LOGGED_IN, value: 'true');
  }

  Future<bool> isUserLoggedIn() async {
    String? value =
        await _storage!.read(key: AppPrefKey.PREFS_KEY_IS_USER_LOGGED_IN);
    return value == 'true';
  }

  Future<void> logout() async {
    await _storage!.delete(key: AppPrefKey.PREFS_KEY_IS_USER_LOGGED_IN);
  }

  Future<void> setTheme(String value) async {
    await _storage!.write(key: AppPrefKey.PREFS_KEY_THEME, value: value);
  }

  Future<String> getTheme() async {
    return await _storage!.read(key: AppPrefKey.PREFS_KEY_THEME) ?? '';
  }

  Future<void> setHistory(List<String> values) async {
    String value = jsonEncode(values);
    await _storage!.write(key: AppPrefKey.PREFS_KEY_HISTORY, value: value);
  }

  Future<List<String>> getHistory() async {
    String? value = await _storage!.read(key: AppPrefKey.PREFS_KEY_HISTORY);
    return value == null ? [] : List<String>.from(jsonDecode(value));
  }

  Future<void> clearHistory() async {
    await _storage!.delete(key: AppPrefKey.PREFS_KEY_HISTORY);
  }

  // Store the count of app reviews or times promoted/shown to user
  Future<void> setAppReview(int value) async {
    await _storage!.write(key: AppPrefKey.PREFS_KEY_APPREVIEW_COUNT, value: value.toString());
  }

  Future<int> getAppReviewCount() async {
    final result =  await _storage!.read(key: AppPrefKey.PREFS_KEY_APPREVIEW_COUNT);
    if(result != null){
      return int.tryParse(result)??0 ;
    } 
    return 0;
  }

  Future<void> setCourseDetailsCount(int value) async {
    await _storage!.write(key: AppPrefKey.PREFS_KEY_COURSE_DETAILS_COUNT, value: value.toString());
  }

  Future<int> getCourseDetailsCount() async {
    final result =  await _storage!.read(key: AppPrefKey.PREFS_KEY_COURSE_DETAILS_COUNT);
    if(result != null){
      return int.tryParse(result)??0 ;
    } 
    return 0;
  }

  Future<void> setGDPR(bool value) async {
    await _storage!.write(key: AppPrefKey.PREFS_KEY_GDPR_ACCEPTED, value: value.toString());
  }

  Future<bool> isGDPRAccepted() async {
    String? value =
        await _storage!.read(key: AppPrefKey.PREFS_KEY_GDPR_ACCEPTED);
    return value == 'true';
  }

  // Future<void> setLastOnAppOpenAddDate(DateTime value) async {
  //   await _storage!.write(key: AppPrefKey.PREFS_KEY_LAST_ON_APP_OPEN_ADD_DATE, value.toIso8601String());
  // }

  // Future<DateTime> getLastOnAppOpenAddDate() async {
  //   final result =  await _storage!.read(key: AppPrefKey.PREFS_KEY_LAST_ON_APP_OPEN_ADD_DATE);
  //   if(result != null){
  //     return DateTime.tryParse(result)??DateTime.now() ;
  //   } 
  //   return DateTime.now();
  // }
}