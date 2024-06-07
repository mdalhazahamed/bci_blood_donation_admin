import 'package:bci_donation_admin/features/athentications/model/login_response_model.dart';

import '../../../api_gateway/api_names.dart';
import '../../../api_gateway/base_model/api_provider.dart';
import '../../../api_gateway/base_model/base_api.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';

class LoginApi extends BaseApi<BaseRequest, LoginResponseModel, BaseError> {
  LoginApi() : super(ApiNames.login, ApiProvider(), BaseError());
  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) {
    final BaseResponse base = BaseResponse.fromJson(responseJson ?? {});
    final LoginResponseModel response = LoginResponseModel.fromJson(responseJson!["data"]);
    response.setStatus(base);
    return response;
  }
}
