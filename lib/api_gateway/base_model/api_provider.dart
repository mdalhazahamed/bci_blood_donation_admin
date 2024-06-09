import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/app_config.dart';
import '../json_data_models/error_response.dart';
import 'base_model.dart';

class ApiProvider extends BaseApiProvider {
  Interceptor get _logInterceptor => LogInterceptor(responseBody: true, requestBody: true, requestHeader: true);
  late final String baseUrl;

  Interceptor _getLoadingInterceptor() => InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          _onStartLoading();
          handler.next(options); //continue
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          _onFinishLoading();
          handler.next(response); // continue
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          String errorMessage = "Something went wrong! Try again later...";
          if (error.response != null && error.response?.data != null) {
            try {
              var errorResponse = ErrorResponse.fromJson(error.response!.data);
              errorMessage = errorResponse.errorMessage ?? errorMessage;
            } catch (e) {
              errorMessage = "error structure error";
            }
          } else if (error.message != null) {
            errorMessage = error.message ?? "";
          } else {
            errorMessage = await connectionCheck();
          }
          if (EasyLoading.isShow) {
            EasyLoading.dismiss(animation: true);
          }
          handler.next(error);
        },
      );

  Future<String> connectionCheck() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return "Please ensure you have a stable internet connection, and try again";
      }
    } on SocketException catch (_) {
      return "Please turn on your internet connection, and try again";
    }
    return "Something went wrong! Try again later...";
  }

  void _onStartLoading() {
    debugPrint("Start Loading animation");
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
  }

  void _onFinishLoading() {
    debugPrint("Finishing Loading animation");
    if (EasyLoading.isShow) {
      EasyLoading.dismiss(animation: true);
    }
  }

  BaseOptions _getBaseOptions() {
    final Map<String, String> _baseHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    BaseOptions options = BaseOptions(baseUrl: appConfig.basePath, headers: _baseHeaders);
    return options;
  }

  ApiProvider() {
    final _options = _getBaseOptions();
    dio = Dio(_options);
    baseUrl = dio.options.baseUrl;
    dio.interceptors.add(_getLoadingInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(_logInterceptor);
    }
  }
}
