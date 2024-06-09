part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class AuthInitial extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;
  LoginErrorState(this.errorMsg);
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final LoginResponseModel loginResponseModel;
  LoginSuccessState(this.loginResponseModel);
}
