import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class LoginReqModel extends BaseRequest {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;
  String? userId;
  String? password;

  LoginReqModel({
    this.userId,
    this.password,
  });

  factory LoginReqModel.fromJson(Map<String, dynamic> json) {
    return LoginReqModel(
      userId: json['userId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'password': password,
    };
  }
}
