// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      json['errorMessage'] as String?,
      json['errorCode'] as String?,
      internalCode: json['internalCode'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'internalCode': instance.internalCode,
    };
