import 'package:bci_donation_admin/features/blood_bank/dataSource/add_bloodbank_api.dart';
import 'package:bci_donation_admin/features/blood_bank/dataSource/get_bloodBanks_api.dart';
import 'package:bci_donation_admin/features/blood_bank/model/blood_bank_model.dart';

import 'package:dartz/dartz.dart';

import '../../../api_gateway/base_model/base_data_source.dart';
import '../../../api_gateway/base_model/base_model.dart';
import '../model/all_bloodbank_res_model.dart';

abstract class BloodBankDataSource {
  Future<BloodBankModel?> addBloodBank(BloodBankModel bloodBankModel);
  Future<AllBloodBankResponseModel?> getBloodBanks();
}

class BloodBankDataSourceImpl extends BaseDataSource implements BloodBankDataSource {
  final BaseError baseError = BaseError();
  final AddBloodBankApi addBloodBankApi = AddBloodBankApi();
  final GetBloodBanksApi getBloodBanksApi = GetBloodBanksApi();

  BloodBankDataSourceImpl();

  @override
  Future<BloodBankModel?> addBloodBank(BloodBankModel bloodBankModel) async {
    final Either<BloodBankModel, BaseError> response = await addBloodBankApi.post(
      bloodBankModel,
      headers: super.authHeaders,
    );
    BloodBankModel? responseEntity;
    response.fold((response) {
      responseEntity = response;
    }, (error) => null);
    return responseEntity;
  }

  @override
  Future<AllBloodBankResponseModel?> getBloodBanks() async {
    final Either<AllBloodBankResponseModel, BaseError> response = await getBloodBanksApi.get();
    AllBloodBankResponseModel? responseEntity;
    response.fold((response) {
      responseEntity = response;
    }, (error) => null);
    return responseEntity;
  }
}
