import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';
@JsonSerializable()
class BaseResponse {

  final String? message;
  final String? developerMessage;
  final bool? isSuccess;
  final int? messageCode;

  BaseResponse(this.isSuccess, this.messageCode, this.message, this.developerMessage);


  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}