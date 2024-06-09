part of 'add_bloodbank_bloc.dart';

@immutable
abstract class AddBloodBankEvent {}

class LoadingAddBloodBankEvent extends AddBloodBankEvent {}

class ErrorAddBloodBankEvent extends AddBloodBankEvent {
  final String errorMsg;
  ErrorAddBloodBankEvent(this.errorMsg);
}

class RequestAddBloodBankEvent extends AddBloodBankEvent {
  final BloodBankModel bloodBankModel;
  RequestAddBloodBankEvent(this.bloodBankModel);
}
