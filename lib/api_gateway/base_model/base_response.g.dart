// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      json['isSuccess'] as bool?,
      json['messageCode'] as int?,
      json['message'] as String?,
      json['developerMessage'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'developerMessage': instance.developerMessage,
      'isSuccess': instance.isSuccess,
      'messageCode': instance.messageCode,
    };
