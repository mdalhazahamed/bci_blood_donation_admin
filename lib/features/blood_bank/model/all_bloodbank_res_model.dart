import 'package:bci_donation_admin/features/blood_bank/model/blood_bank_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_response.dart';

@JsonSerializable()
class AllBloodBankResponseModel extends BaseModel {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;
  final List<BloodBankModel>? bloodBanks;

  AllBloodBankResponseModel({
    this.bloodBanks,
  });

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }

  factory AllBloodBankResponseModel.fromJson(List<dynamic> json) {
    List<BloodBankModel> models = [];
    for (var element in json) {
      BloodBankModel registrationResponseModel = BloodBankModel.fromJson(element);
      models.add(registrationResponseModel);
    }
    return AllBloodBankResponseModel(
      bloodBanks: models,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bloodBanks != null) {
      data['bloodBanks'] = bloodBanks!.map((donor) => donor.toJson()).toList();
    }
    return data;
  }
}
