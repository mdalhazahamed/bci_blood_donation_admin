import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AppConfig {
  static const int NO_UPDATE = 0;
  static const int FORCE_UPDATE = 1;
  static const int OPTIONAL_UPDATE = 2;

  // int get normalUpdate => 2;
  static final _config = AppConfig._internal();
  late final int _timeZoneOffset;
  AppConfig._internal();

  factory AppConfig() {
    _config._timeZoneOffset = DateTime.now().timeZoneOffset.inMinutes;
    return _config;
  }

  // static const String _prodUrl = "https://url";
  // final String _baseUrl = "http://172.16.201.166:8051/bloodbank-backend/";
  final String _baseUrl = "http://192.168.0.104:8051/bloodbank-backend/";
  int _updateStatus = 0;
  int get updateStatus => _updateStatus;
  String get basePath => _baseUrl;
  int get timeZoneOffset => _config._timeZoneOffset;
  final String _appStoreUrl = "";
  final String _playStoreUrl = "";
  String get appStoreUrl => _appStoreUrl;
  String get playStoreUrl => _playStoreUrl;
  String? _privacyUrl;
  String? _termsUrl;
  bool _subscriptionActive = false;
  bool _adEngineActive = false;
  String offensiveWords = "";
  String instantMsgBody = "";
  StreamSubscription? _appConfigSubscriber;
  String? get termsUrl => _termsUrl;
  String? get privacyUrl => _privacyUrl;
  bool get subscriptionON => _subscriptionActive;
  bool get adEngineActive => _adEngineActive;

  final PublishSubject<bool> _firebasePublisher = PublishSubject();
  PublishSubject<bool> get firebasePublisher => _firebasePublisher;

  void readAppConfig() async {
    // final CollectionReference _collection = FirebaseFirestore.instance.collection("com.wearefriends");
    // final DocumentReference doc = _collection.doc("wafconfig");
    // this._appConfigSubscriber = doc.snapshots().listen(_onReadConfig);
    // _appConfigSubscriber?.onError(_onError);
  }

  void _onError(final _error) {
    debugPrint("IA AM DONE");
  }

  // void _onReadConfig(DocumentSnapshot documentSnapshot) async {
  //
  //   if (documentSnapshot.exists) {
  //     final _data = documentSnapshot.data();
  //     if (_data != null) {
  //       this.offensiveWords = _data["offensive_words"];
  //       final _addEngine = _data["ad_engine"];
  //       final _versions = _data["version_url"];
  //       String? _appVersion = await deviceInfo.getAppVersion();
  //       if (_versions is Map && _appVersion != null && _versions.keys.contains(_appVersion)) {
  //         this._baseUrl = _versions[_appVersion]?.toString() ?? "";
  //       }
  //       if (this._baseUrl.isEmpty) {
  //         this._baseUrl = _prodUrl;
  //       }
  //       final _versionUpdateMap = _data["version_update_map"];
  //       if(_versionUpdateMap is Map && _appVersion != null) {
  //         if (_versionUpdateMap.containsKey(_appVersion)) {
  //           final _status = _versionUpdateMap[_appVersion];
  //           if (_status is int) {
  //             _updateStatus = _status;
  //           }
  //         }
  //       }
  //
  //       if (_addEngine is bool) {
  //         this._adEngineActive = _addEngine;
  //       }
  //
  //       final _appStore = _data["app_store_url"];
  //       if (_appStore != null) {
  //         _appStoreUrl = _appStore;
  //       }
  //
  //       final _playStore = _data["play_store_url"];
  //       if (_playStore != null) {
  //         _playStoreUrl = _playStore;
  //       }
  //
  //       final _appVersions = _data["app_versions"];
  //       if (_appVersions is List) {
  //         this._versionList = List<String>.from(_appVersions);
  //       }
  //
  //       final _subscribe = _data["subscription"];
  //       if (_subscribe is bool) {
  //         this._subscriptionActive = _subscribe;
  //       }
  //
  //       final _privacy = _data["privacy_url"];
  //       if (_privacy is String) {
  //         this._privacyUrl = _privacy;
  //       }
  //
  //       final _terms = _data["terms_url"];
  //       if (_privacy is String) {
  //         this._termsUrl = _terms;
  //       }
  //
  //       _firebasePublisher.sink.add(true);
  //     } else {
  //       _firebasePublisher.sink.add(false);
  //     }
  //   } else {
  //     _firebasePublisher.sink.add(false);
  //   }
  // }

  void dispose() async {
    if (_appConfigSubscriber != null) {
      _appConfigSubscriber?.cancel();
    }
    _firebasePublisher.close();
  }
  //
  // void checkUpdates(final String? _myAppVersion) {
  //   _config._updateStatus = 0;
  //   if (_myAppVersion != null && _myAppVersion.isNotEmpty) {
  //     if (!_config._versionList.contains(_myAppVersion)) {
  //       _config._updateStatus = 1;
  //     } else {
  //       List<String> _subVersions = _myAppVersion.split(".");
  //       int _first, _second, _third;
  //       try {
  //         String? _mFirst = _subVersions.first;
  //         _first = int.tryParse(_mFirst) ?? -1;
  //         String _mSecond = _subVersions.length > 1 ? _subVersions[1] : "-1";
  //         _second = int.tryParse(_mSecond) ?? 0;
  //         String _mLast = _subVersions.length > 2 ? _subVersions[2] : "-1";
  //         _third = int.tryParse(_mLast) ?? 0;
  //       } catch (exception) {
  //         //send exception to server//crashlytics
  //         return;
  //       }
  //       for (int i = _versionList.length - 1; i >= 0; i--) {
  //         final String _serverVersion = _versionList[i];
  //         final List<String> _serverSubVersions = _serverVersion.split(".");
  //         try {
  //           String? _sFirst = _serverSubVersions.first;
  //           String? _sSecond = _serverSubVersions[1];
  //           String? _sLast = _serverSubVersions.last;
  //           if (_sFirst.isNotEmpty && _sSecond.isNotEmpty) {
  //             int _start = int.tryParse(_sFirst) ?? 0;
  //             if (_first < _start) {
  //               this._updateStatus = 2;
  //               break;
  //             } else if (_first > _start) {
  //               continue;
  //             }
  //             int _middle = int.tryParse(_sSecond) ?? 0;
  //             if (_second < _middle) {
  //               this._updateStatus = 2;
  //               break;
  //             } else if (_second > _middle) {
  //               continue;
  //             }
  //             int _end = int.tryParse(_sLast) ?? 0;
  //             if (_third < _end) {
  //               this._updateStatus = 2;
  //               break;
  //             }
  //           }
  //         } catch (exception) {
  //           //send exception to server//crashlytics
  //         }
  //       }
  //     }
  //   }
  // }
}

final AppConfig appConfig = AppConfig();
