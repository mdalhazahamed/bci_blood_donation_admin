import 'package:dartz/dartz.dart';

import '../../../api_gateway/base_model/base_data_source.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../model/donor_res_model.dart';
import '../model/id_type_req_model.dart';
import 'get_bloodDonor_api.dart';

abstract class BloodDonorDataSource {
  Future<BloodDonorResponseModel?> getBloodDonors(IdTypeModel idTypeModel);
}

class BloodDonorDataSourceImpl extends BaseDataSource implements BloodDonorDataSource {
  final BaseError baseError = BaseError();
  final GetBloodDonorApi getBloodDonorApi = GetBloodDonorApi();

  BloodDonorDataSourceImpl();

  @override
  Future<BloodDonorResponseModel?> getBloodDonors(IdTypeModel idTypeModel) async {
    if (idTypeModel.type != null) {
      final Either<BloodDonorResponseModel, BaseError> response = await getBloodDonorApi.get(param: "/${idTypeModel.type}");
      BloodDonorResponseModel? responseEntity;
      response.fold((response) {
        responseEntity = response;
      }, (error) => null);
      return responseEntity;
    } else {
      final Either<BloodDonorResponseModel, BaseError> response = await getBloodDonorApi.get();
      BloodDonorResponseModel? responseEntity;
      response.fold((response) {
        responseEntity = response;
      }, (error) => null);
      return responseEntity;
    }
  }
}
