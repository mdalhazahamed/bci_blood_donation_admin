part of 'get_bloodbank_bloc.dart';

@immutable
abstract class GetBloodBankState {}

class AuthInitial extends GetBloodBankState {}

class GetBloodBankErrorState extends GetBloodBankState {
  final String errorMsg;
  GetBloodBankErrorState(this.errorMsg);
}

class GetBloodBankLoadingState extends GetBloodBankState {
  GetBloodBankLoadingState();
}

class GetBloodBankSuccessState extends GetBloodBankState {
  final AllBloodBankResponseModel allBloodBankResponseModel;
  GetBloodBankSuccessState(this.allBloodBankResponseModel);
}
