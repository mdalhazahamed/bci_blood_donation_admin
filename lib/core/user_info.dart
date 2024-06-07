import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../features/athentications/model/login_response_model.dart';
import 'app_config.dart';
import 'package:rxdart/rxdart.dart';

import '../api_gateway/base_model/resource.dart';
import 'data_manager.dart';

class UserInfo {
  bool isCountryState = false;
  bool autoLogin = false;
  bool registerLogin = false;
  bool isLimitedAccess = false;
  bool isGuardianLogin = false;
  bool isSelfieRejectedDialogShown = false;
  bool isSelfieAcceptedDialogShown = false;
  String? loginTime;
  String? logoutTime;
  int appStatus = -1;
  String refreshToken = "";
  String authToken = "";
  String name = "";
  String mail = "";
  String id = "";
  String profileImgUrl = "";
  String faceFeatures = "";
  int tokenValidity = 0;
  String username = "";
  bool isProfileInfoChanged = false;
  BuildContext? context;
  String userBirthDay = "";
  static final _info = UserInfo._internal();
  UserInfo._internal();
  factory UserInfo() {
    return _info;
  }

  BehaviorSubject<Resource>? _notificationSubject;
  bool isMessage = false;
  BehaviorSubject<Resource> getNotificationBehavior() {
    if (_notificationSubject != null) {
      return _notificationSubject!;
    }
    _notificationSubject = BehaviorSubject();
    return _notificationSubject!;
  }

  // Future<void> setUserId(final MeEntity _response) async {
  //   if (_response.id != null) {
  //     userInfo.id = _response.id.toString();
  //   } else {
  //     userInfo.id = "";
  //   }
  //   await dataManager.saveID(userInfo.id);
  // }

  // Future<void> setOtpUserData(final LoginOtpResponseEntity _response) async {
  //   userInfo.authToken = _response.access_token ?? "";
  //   userInfo.refreshToken = refreshToken;
  //   // userInfo.username = _response.loginUser!.username;
  //   userInfo.id = _response.user_id.toString();
  //   // userInfo.name = _response.name.toString();
  //   userInfo.refreshToken = refreshToken;
  //   await dataManager.saveToken(userInfo.authToken);
  //   // await dataManager.saveRefreshToken(userInfo.refreshToken);
  //   // await dataManager.saveUsername(userInfo.username);
  //   await dataManager.saveName(userInfo.name);
  //   await dataManager.saveID(userInfo.id);
  //   await dataManager.saveMail(userInfo.mail);
  //   await dataManager.saveProfileUrl(userInfo.profileImgUrl);
  //   await dataManager.saveDOB(userInfo.userBirthDay);
  //   if (refreshToken.isNotEmpty) {
  //     await dataManager.saveRefreshToken(refreshToken);
  //   }
  // }

  Future<void> setUserData(final LoginResponseModel _response) async {
    userInfo.authToken = _response.tokenInfo!.token ?? "";
    // final String refreshToken = _response.refreshToken ?? "";
    userInfo.refreshToken = refreshToken;
    userInfo.mail = _response.userInfo!.email ?? "";
    // userInfo.username = _response.loginUser!.username;
    userInfo.id = _response.userInfo!.id.toString();
    userInfo.name = _response.userInfo!.firstName.toString() + " " + _response.userInfo!.lastName.toString();
    userInfo.refreshToken = refreshToken;
    await dataManager.saveToken(userInfo.authToken);
    await dataManager.saveID(userInfo.id);
    await dataManager.saveName(userInfo.name);
    await dataManager.saveMail(userInfo.mail);
    await dataManager.saveProfileUrl(userInfo.profileImgUrl);
    await dataManager.saveDOB(userInfo.userBirthDay);
    if (refreshToken.isNotEmpty) {
      await dataManager.saveRefreshToken(refreshToken);
    }
  }

  bool get isLoggedIn => authToken.isNotEmpty && username.isNotEmpty;

  void clearLogin() {
    dataManager.saveToken("");
    dataManager.saveID("");
    dataManager.saveMail("");
    dataManager.saveRefreshToken("");
    dataManager.saveLimitedAccessStatus(false);
    isLimitedAccess = false;
    isGuardianLogin = false;
    autoLogin = false;
    authToken = "";
    username = "";
    _notificationSubject?.close();
    _notificationSubject = null;
  }

  Map<String, String> getAuthData() {
    String username = 'ck_79734479cee1e56cc520d873991ddab19e30c423';
    String password = 'cs_12a981d8632a54323336f4acf5ed6616d33bd556';
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // if (userInfo.authToken.isNotEmpty) "AuthenticationToken": userInfo.authToken,
      // if (userInfo.authToken.isNotEmpty) "Authorization": "Bearer ${userInfo.authToken}",
      "Authorization": basicAuth,
      "timeDifference": "${appConfig.timeZoneOffset}",
      "x-api-version": "1.1"
    };
  }
}

final UserInfo userInfo = UserInfo();
