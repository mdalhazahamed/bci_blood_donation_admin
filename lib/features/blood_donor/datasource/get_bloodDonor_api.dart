import '../../../api_gateway/api_names.dart';
import '../../../api_gateway/base_model/api_provider.dart';
import '../../../api_gateway/base_model/base_api.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';
import '../model/donor_res_model.dart';

class GetBloodDonorApi extends BaseApi<BaseRequest, BloodDonorResponseModel, BaseError> {
  GetBloodDonorApi() : super(ApiNames.bloodDonors, ApiProvider(), BaseError());
  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) {
    final BaseResponse base = BaseResponse.fromJson(responseJson ?? {});
    final BloodDonorResponseModel response = BloodDonorResponseModel.fromJson(responseJson!["data"]);
    response.setStatus(base);
    return response;
  }
}
