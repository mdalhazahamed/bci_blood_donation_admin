import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class LoginResponseModel extends BaseModel {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;

  UserInfo? userInfo;
  TokenInfo? tokenInfo;

  LoginResponseModel({
    this.userInfo,
    this.tokenInfo,
  });

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userInfo: UserInfo.fromJson(json['userInfo']),
      tokenInfo: TokenInfo.fromJson(json['tokenInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userInfo': userInfo!.toJson(),
      'tokenInfo': tokenInfo!.toJson(),
    };
  }
}

class UserInfo {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? bloodGroup;
  int? imageId;
  String? phoneNo;
  List<String>? roleNames;

  UserInfo({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.bloodGroup,
    this.imageId,
    this.roleNames,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      bloodGroup: json['bloodGroup'],
      imageId: json['imageId'],
      phoneNo: json['phoneNo'],
      roleNames: List<String>.from(json['roleNames']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'bloodGroup': bloodGroup,
      'imageId': imageId,
      'phoneNo': phoneNo,
      'roleNames': roleNames,
    };
  }
}

class TokenInfo {
  String? type;
  String? token;

  TokenInfo({
    this.type,
    this.token,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    return TokenInfo(
      type: json['type'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'token': token,
    };
  }
}
