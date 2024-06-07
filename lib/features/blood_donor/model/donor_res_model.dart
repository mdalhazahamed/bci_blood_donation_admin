import 'package:json_annotation/json_annotation.dart';

import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_response.dart';
import '../../athentications/model/reg_res_model.dart';

@JsonSerializable()
class BloodDonorResponseModel extends BaseModel {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;
  final List<RegistrationResponseModel>? bloodDonors;

  BloodDonorResponseModel({
    this.bloodDonors,
  });

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }

  factory BloodDonorResponseModel.fromJson(List<dynamic> json) {
    List<RegistrationResponseModel> models = [];
    for (var element in json) {
      RegistrationResponseModel registrationResponseModel = RegistrationResponseModel.fromJson(element);
      models.add(registrationResponseModel);
    }
    return BloodDonorResponseModel(
      bloodDonors: models,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bloodDonors != null) {
      data['bloodDonors'] = bloodDonors!.map((donor) => donor.toJson()).toList();
    }
    return data;
  }
}
