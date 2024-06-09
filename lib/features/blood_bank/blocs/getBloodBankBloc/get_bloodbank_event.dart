part of 'get_bloodbank_bloc.dart';

@immutable
abstract class GetBloodBankEvent {}

class LoadingGetBloodBankEvent extends GetBloodBankEvent {}

class ErrorGetBloodBankEvent extends GetBloodBankEvent {
  final String errorMsg;
  ErrorGetBloodBankEvent(this.errorMsg);
}

class RequestGetBloodBankEvent extends GetBloodBankEvent {
  RequestGetBloodBankEvent();
}
