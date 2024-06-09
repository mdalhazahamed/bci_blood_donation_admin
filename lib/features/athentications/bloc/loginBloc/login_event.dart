part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoadingLoginEvent extends LoginEvent {}

class ErrorLoginEvent extends LoginEvent {
  final String errorMsg;
  ErrorLoginEvent(this.errorMsg);
}

class RequestLoginEvent extends LoginEvent {
  final LoginReqModel loginReqModel;
  RequestLoginEvent(this.loginReqModel);
}
