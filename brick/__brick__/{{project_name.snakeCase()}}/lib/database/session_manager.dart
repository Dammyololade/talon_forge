import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  late SharedPreferences _sharedPreferences;

  SessionManager._internal();

  static final SessionManager _sessionManager = SessionManager._internal();

  factory SessionManager() => _sessionManager;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String _themeKey = "theme";
  static const String _tokenKey = "token";

  set theme(String value) => _sharedPreferences.setString(_themeKey, value);

  String get theme => _sharedPreferences.getString(_themeKey) ?? "dark";

  set token(String value) => _sharedPreferences.setString(_tokenKey, value);

  String get token => _sharedPreferences.getString(_tokenKey) ?? "";

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

  Future<void> clearSession() async {
    await _sharedPreferences.clear();
  }

  Future<void> reload() async => await _sharedPreferences.reload();
}
