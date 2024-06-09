import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/utils/toast.dart';

abstract class BaseModel<T> {
  const BaseModel();
  Map<String, dynamic> toJson();

  @override
  String toString() => json.encode(toJson());
}

class BaseError {
  DioError? dioError;
  String? getMessage({String? lang}) {
    return dioError?.message;
  }

  void setDioError(DioError error) => dioError = error;
  void generateError(Map<String, dynamic>? data) {
    toastMsg(data!["message"] ?? "");
  }

  BaseError generate(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.connectionTimeout || error.type == DioErrorType.sendTimeout) {
        dioError = error;
      } else if (error.type == DioErrorType.unknown) {
        toastMsg(error.message ?? "");
      } else {
        try {
          generateError(error.response?.data as Map<String, dynamic>?);
        } catch (e) {
          String message = "";
          error.response?.data.forEach((x) => message += x['message'] + "\n");
          toastMsg(message);
        } finally {
          // toastMsg("Something went wrong!");
        }
      }
    }
    return this;
  }
}

abstract class BaseApiProvider {
  late Dio dio;
  static const int CONNECT_TIMEOUT = 29000;
  static const int RECEIVE_TIMEOUT = 29000;
}
