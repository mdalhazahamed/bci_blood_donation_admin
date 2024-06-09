import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class RegistrationResponseModel extends BaseModel {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;
  final int id;
  final String userId;
  final String? imageId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String? address;
  final String? facebook;
  final String bloodGroup;
  final List<String> roleNames;

  RegistrationResponseModel({
    required this.id,
    required this.userId,
    this.imageId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    this.address,
    this.facebook,
    required this.bloodGroup,
    required this.roleNames,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return RegistrationResponseModel(
      id: json['id'] as int,
      userId: json['userId'] as String,
      imageId: json['imageId'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      address: json['address'] as String?,
      facebook: json['facebook'] as String?,
      bloodGroup: json['bloodGroup'] as String,
      roleNames: (json['roleNames'] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'imageId': imageId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNo': phoneNo,
      'address': address,
      'facebook': facebook,
      'bloodGroup': bloodGroup,
      'roleNames': roleNames,
    };
  }

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }
}
