import 'user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_formatter.dart';

class DataManager {
  // ignore: non_constant_identifier_names
  static String get refresh_token_key => "refresh_token";
  static final _data = DataManager._internal();

  DataManager._internal();

  factory DataManager() {
    return _data;
  }

  Future<String> _getStringValue(final String _key) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final String _rToken = _sharedPreference.getString(_key) ?? "";
    return _rToken;
  }

  Future<void> _setStringValue(final String _key, final String _value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString(_key, _value);
  }

  Future<int> _getIntValue(final String _key) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final int _rToken = _sharedPreference.getInt(_key) ?? -1;
    return _rToken;
  }

  Future<void> _setIntValue(final String _key, final int _value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setInt(_key, _value);
  }

  Future<bool> _getBoolValue(final String _key) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final bool _rToken = _sharedPreference.getBool(_key) ?? false;
    return _rToken;
  }

  Future<void> _setBoolValue(final String _key, final bool _value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setBool(_key, _value);
  }

  Future<void> saveRefreshToken(final String _refreshToken) async {
    await _setStringValue(WKey.loginRefreshKey, _refreshToken);
  }

  // static String get uploadProfilePictureKey => "profile_picture_key";
  // static String get loginAuthorizationKey => "authorization_key";
  // static String get loginMemberIdentifierKey => "member_id_key";
  //
  // static String get loginRefreshKey => "refresh_key";
  Future<String> getRefreshToken() async {
    return await _getStringValue(WKey.loginRefreshKey);
  }

  Future<void> saveUsername(final String _token) async {
    await _setStringValue(WKey.userNameKey, _token);
  }

  Future<String> getUsername() async {
    return await _getStringValue(WKey.userNameKey);
  }

  Future<void> saveProfileUrl(final String _token) async {
    await _setStringValue(WKey.profileUrlKey, _token);
  }

  Future<String> getProfileUrl() async {
    return await _getStringValue(WKey.profileUrlKey);
  }

  Future<void> saveToken(final String _token) async {
    await _setStringValue(WKey.loginAuthorizationKey, _token);
  }

  Future<String> getAuthToken() async {
    return await _getStringValue(WKey.loginAuthorizationKey);
  }

  Future<void> setDate() async {
    final String _date = DateTime.now().toString();
    await _setStringValue(WKey.feelingDateKey + "_" + userInfo.username, _date);
  }

  Future<void> saveDOB(final String _token) async {
    await _setStringValue(WKey.loginBirthDteKey, _token);
  }

  Future<String> getFeelingsDate() async {
    return await _getStringValue(WKey.feelingDateKey + "_" + userInfo.username);
  }

  Future<String> getDOB() async {
    return await _getStringValue(WKey.loginBirthDteKey);
  }

  Future<void> saveID(final String _token) async {
    await _setStringValue(WKey.loginMemberIdentifierKey, _token);
  }

  Future<String> getID() async {
    return await _getStringValue(WKey.loginMemberIdentifierKey);
  }

  Future<void> saveName(final String _token) async {
    await _setStringValue(WKey.nameKey, _token);
  }

  Future<String> getName() async {
    return await _getStringValue(WKey.nameKey);
  }

  Future<void> saveMail(final String _token) async {
    await _setStringValue(WKey.userMailKey, _token);
  }

  Future<String> getMail() async {
    return await _getStringValue(WKey.userMailKey);
  }

  Future<void> saveMbbsLibraryNames(final String _token) async {
    await _setStringValue(WKey.libraryMbbsFolderNameKey, _token);
  }

  Future<String> getMbbsLibraryNames() async {
    return await _getStringValue(WKey.libraryMbbsFolderNameKey);
  }

  Future<void> saveDarkThemeStatus(final bool _token) async {
    await _setBoolValue(WKey.darkThemeStatus, _token);
  }

  Future<bool> getDarkThemeStatus() async {
    return await _getBoolValue(WKey.darkThemeStatus);
  }

  Future<void> saveLimitedAccessStatus(final bool _token) async {
    await _setBoolValue(WKey.guardianLoggedInStatus, _token);
  }

  Future<bool> getGuardianLogInStatus() async {
    return await _getBoolValue(WKey.guardianLoggedInStatus);
  }

  Future<void> saveGreetingYear(final String _token) async {
    await _setStringValue(WKey.greetingYearKey, _token);
  }

  Future<String> getGreetingYear() async {
    return await _getStringValue(WKey.greetingYearKey);
  }
}

DataManager dataManager = DataManager();
