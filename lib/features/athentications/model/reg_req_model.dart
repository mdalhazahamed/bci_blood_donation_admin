import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class RegistrationReqModel extends BaseRequest {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;

  String? userId;
  int? imageId;
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNo;
  String? address;
  String? district;
  String? bloodGroup;
  List<int>? roleIds;

  RegistrationReqModel({
    this.userId,
    this.imageId,
    this.firstName,
    this.lastName,
    this.password,
    this.email,
    this.phoneNo,
    this.address,
    this.district,
    this.bloodGroup,
    this.roleIds,
  });

  factory RegistrationReqModel.fromJson(Map<String, dynamic> json) {
    return RegistrationReqModel(
      userId: json['userId'] as String,
      imageId: json['imageId'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      address: json['address'] as String,
      district: json['district'] as String,
      bloodGroup: json['bloodGroup'] as String,
      roleIds: (json['roleIds'] as List).map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'imageId': imageId,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'phoneNo': phoneNo,
      'address': address,
      'district': district,
      'bloodGroup': bloodGroup,
      'roleIds': roleIds,
    };
  }
}
