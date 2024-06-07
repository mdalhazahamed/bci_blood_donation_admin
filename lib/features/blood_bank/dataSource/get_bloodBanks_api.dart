import 'package:bci_donation_admin/features/blood_bank/model/all_bloodbank_res_model.dart';

import '../../../api_gateway/api_names.dart';
import '../../../api_gateway/base_model/api_provider.dart';
import '../../../api_gateway/base_model/base_api.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../../../api_gateway/base_model/base_request.dart';
import '../../../api_gateway/base_model/base_response.dart';

class GetBloodBanksApi extends BaseApi<BaseRequest, AllBloodBankResponseModel, BaseError> {
  GetBloodBanksApi() : super(ApiNames.getBloodBanks, ApiProvider(), BaseError());
  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) {
    final BaseResponse base = BaseResponse.fromJson(responseJson ?? {});
    final AllBloodBankResponseModel response = AllBloodBankResponseModel.fromJson(responseJson!["data"]);
    response.setStatus(base);
    return response;
  }
}
