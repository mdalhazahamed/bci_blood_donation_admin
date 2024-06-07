part of 'add_bloodbank_bloc.dart';

@immutable
abstract class AddBloodBankState {}

class AuthInitial extends AddBloodBankState {}

class AddBloodBankErrorState extends AddBloodBankState {
  final String errorMsg;
  AddBloodBankErrorState(this.errorMsg);
}

class AddBloodBankLoadingState extends AddBloodBankState {
  AddBloodBankLoadingState();
}

class AddBloodBankSuccessState extends AddBloodBankState {
  final BloodBankModel bloodBankModel;
  AddBloodBankSuccessState(this.bloodBankModel);
}
