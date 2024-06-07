part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class LoadingRegisterEvent extends RegisterEvent {}

class ErrorRegisterEvent extends RegisterEvent {
  final String errorMsg;
  ErrorRegisterEvent(this.errorMsg);
}

class RequestRegisterEvent extends RegisterEvent {
  final RegistrationReqModel registrationReqModel;
  RequestRegisterEvent(this.registrationReqModel);
}
