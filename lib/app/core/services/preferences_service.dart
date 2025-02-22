import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  controllerId,
  controllerName,
}

extension PreferenceKeyExtension on PreferenceKey {
  String get key {
    switch (this) {
      case PreferenceKey.controllerId:
        return 'controller_id';
      case PreferenceKey.controllerName:
        return 'controller_name';
    }
  }
}

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();
  factory PreferencesService() => _instance;
  PreferencesService._internal();

  SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> setString(PreferenceKey key, String value) async {
    final preferences = await prefs;
    await preferences.setString(key.key, value);
  }

  Future<String?> getString(PreferenceKey key) async {
    final preferences = await prefs;
    return preferences.getString(key.key);
  }

  Future<void> setBool(PreferenceKey key, bool value) async {
    final preferences = await prefs;
    await preferences.setBool(key.key, value);
  }

  Future<bool?> getBool(PreferenceKey key) async {
    final preferences = await prefs;
    return preferences.getBool(key.key);
  }

  // Add more methods for other types as needed

  Future<void> remove(PreferenceKey key) async {
    final preferences = await prefs;
    await preferences.remove(key.key);
  }

  Future<void> clear() async {
    final preferences = await prefs;
    await preferences.clear();
  }
} 