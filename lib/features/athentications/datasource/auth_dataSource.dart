import 'package:bci_donation_admin/features/athentications/datasource/login_api.dart';
import 'package:bci_donation_admin/features/athentications/datasource/register_api.dart';
import 'package:bci_donation_admin/features/athentications/model/login_response_model.dart';
import 'package:bci_donation_admin/features/athentications/model/reg_req_model.dart';
import 'package:bci_donation_admin/features/athentications/model/reg_res_model.dart';

import 'package:dartz/dartz.dart';

import '../../../api_gateway/base_model/base_data_source.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../model/login_req_model.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel?> login(LoginReqModel loginReqModel);
  Future<RegistrationResponseModel?> register(RegistrationReqModel registrationReqModel);
}

class AuthDataSourceImpl extends BaseDataSource implements AuthDataSource {
  final BaseError baseError = BaseError();
  final LoginApi loginApi = LoginApi();
  final RegisterApi registerApi = RegisterApi();

  AuthDataSourceImpl();

  @override
  Future<LoginResponseModel?> login(LoginReqModel loginReqModel) async {
    final Either<LoginResponseModel, BaseError> response = await loginApi.post(loginReqModel);
    LoginResponseModel? responseEntity;
    response.fold((response) {
      responseEntity = response;
    }, (error) => null);
    if (responseEntity != null && !responseEntity!.userInfo!.roleNames!.contains("ADMIN")) {
      return null;
    }
    return responseEntity;
  }

  @override
  Future<RegistrationResponseModel?> register(RegistrationReqModel registrationReqModel) async {
    final Either<RegistrationResponseModel, BaseError> response = await registerApi.post(registrationReqModel);
    RegistrationResponseModel? responseEntity;
    response.fold((response) {
      responseEntity = response;
    }, (error) => null);
    return responseEntity;
  }
}
