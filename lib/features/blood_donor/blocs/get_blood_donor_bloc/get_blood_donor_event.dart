part of 'get_blood_donor_bloc.dart';

@immutable
abstract class GetBloodDonorsEvent {}

class LoadingGetBloodDonorsEvent extends GetBloodDonorsEvent {}

class ErrorGetBloodDonorsEvent extends GetBloodDonorsEvent {
  final String errorMsg;
  ErrorGetBloodDonorsEvent(this.errorMsg);
}

class RequestGetBloodDonorsEvent extends GetBloodDonorsEvent {
  final IdTypeModel idTypeModel;
  RequestGetBloodDonorsEvent(this.idTypeModel);
}
