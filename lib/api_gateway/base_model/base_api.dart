// WeAreFriends Inc
// name : mostafizur rahman
// mobile : +8801675876752
// Created by mostafizurrahman on 17/12/21
// https://wearefriends.today

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'base_model.dart';

abstract class BaseApi<TRequest extends BaseModel, TResponse extends BaseModel, TError extends BaseError> {
  final String url;
  final BaseApiProvider apiProvider;
  final BaseError baseError;

  BaseApi(this.url, this.apiProvider, this.baseError);

  Future<Response<Map<String, dynamic>>> postRaw(TRequest input, {Map<String, String>? headers, String param = ''}) async {
    String requestBody = input.toString();
    Response<Map<String, dynamic>> response = await apiProvider.dio.post(
      url + param,
      data: requestBody,
      options: Options(
        headers: headers ?? {},
        sendTimeout: Duration(milliseconds: BaseApiProvider.CONNECT_TIMEOUT),
        receiveTimeout: Duration(milliseconds: BaseApiProvider.RECEIVE_TIMEOUT),
      ),
    );
    return response;
  }

  Future<Either<TResponse, TError>> post(TRequest input, {Map<String, String>? headers, String param = ''}) async {
    try {
      Response<Map<String, dynamic>> response = await postRaw(input, headers: headers, param: param);
      return Left(mapResponse(response.data) as TResponse);
    } on DioException catch (error) {
      return Right(baseError.generate(error) as TError);
    } catch (err) {
      print(err);
      return Right(baseError.generate(err) as TError);
    }
  }

  Future<Response<Map<String, dynamic>>> getRaw({Map<String, String>? headers, String param = '', Map<String, dynamic>? data}) async {
    Response<Map<String, dynamic>> response = await apiProvider.dio.get(
      url + param,
      queryParameters: data,
      options: Options(
        headers: headers ?? {'Content-Type': 'application/json'},
        sendTimeout: Duration(milliseconds: BaseApiProvider.CONNECT_TIMEOUT),
        receiveTimeout: Duration(milliseconds: BaseApiProvider.RECEIVE_TIMEOUT),
      ),
    );
    return response;
  }

  Future<Either<TResponse, TError>> get({Map<String, String>? headers, String param = '', Map<String, dynamic>? params}) async {
    try {
      Response<Map<String, dynamic>> response = await getRaw(headers: headers, param: param, data: params);
      final Map<String, dynamic>? _data = response.data;
      return Left(mapResponse(_data) as TResponse);
    } on DioException catch (error) {
      return Right(baseError.generate(error) as TError);
    } catch (err) {
      print(err);
      return Right(baseError.generate(err) as TError);
    }
  }

  //new
  Future<Response<dynamic>> getFileRaw(url2, {Map<String, String>? headers, String param = ''}) async {
    Response<dynamic> response = await apiProvider.dio.get(
      url2 + param,
      options: Options(
        headers: headers ?? {'Content-Type': 'application/json'},
        sendTimeout: Duration(milliseconds: BaseApiProvider.CONNECT_TIMEOUT),
        receiveTimeout: Duration(milliseconds: BaseApiProvider.RECEIVE_TIMEOUT),
      ),
    );
    return response;
  }

  BaseModel mapResponse(Map<String, dynamic>? responseJson);
}
