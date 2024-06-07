part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class AuthInitial extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMsg;
  RegisterErrorState(this.errorMsg);
}

class RegisterLoadingState extends RegisterState {
  RegisterLoadingState();
}

class RegisterSuccessState extends RegisterState {
  final RegistrationResponseModel registrationResponseModel;
  RegisterSuccessState(this.registrationResponseModel);
}
