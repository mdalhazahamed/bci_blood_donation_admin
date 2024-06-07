import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class BloodBankModel extends BaseRequest {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;
  int? bloodBankId;
  String? name;
  String? address;
  String? phone;
  String? mapLink;
  String? activeYn;

  BloodBankModel({
    this.bloodBankId,
    this.name,
    this.address,
    this.phone,
    this.mapLink,
    this.activeYn,
  });

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }

  // Factory constructor to create an instance from JSON
  factory BloodBankModel.fromJson(Map<String, dynamic> json) {
    return BloodBankModel(
      bloodBankId: json['bloodBankId'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      mapLink: json['mapLink'] as String?,
      activeYn: json['activeYn'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'bloodBankId': bloodBankId,
      'name': name,
      'address': address,
      'phone': phone,
      'mapLink': mapLink,
      'activeYn': activeYn,
    };
  }
}
