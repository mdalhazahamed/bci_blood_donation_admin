import '../../../../api_gateway/api_names.dart';
import '../../../../api_gateway/base_model/api_provider.dart';
import '../../../../api_gateway/base_model/base_api.dart';
import '../../../../api_gateway/base_model/base_model.dart';
import '../../../../api_gateway/base_model/base_request.dart';
import '../../../../api_gateway/base_model/base_response.dart';
import '../../model/reg_res_model.dart';

class RegisterApi extends BaseApi<BaseRequest, RegistrationResponseModel, BaseError> {
  RegisterApi() : super(ApiNames.register, ApiProvider(), BaseError());
  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) {
    final BaseResponse base = BaseResponse.fromJson(responseJson ?? {});
    final RegistrationResponseModel response = RegistrationResponseModel.fromJson(responseJson!["data"]);
    response.setStatus(base);
    return response;
  }
}
