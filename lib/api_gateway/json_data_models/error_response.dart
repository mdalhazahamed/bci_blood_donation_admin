
import 'package:json_annotation/json_annotation.dart';

import '../base_model/base_model.dart';
import '../entities/error_view_model.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends BaseModel<ErrorResponse> {

  final String? errorMessage;
  final String? errorCode;
  final String? internalCode;

  ErrorResponse( this.errorMessage, this.errorCode, {this.internalCode});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  ErrorViewModel toEntity() {
    return ErrorViewModel(errorMessage, errorCode, internalCode: internalCode);
  }
}