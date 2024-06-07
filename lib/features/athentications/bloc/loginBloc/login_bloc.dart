import 'dart:async';

import 'package:bci_donation_admin/core/user_info.dart';
import 'package:bci_donation_admin/features/athentications/datasource/auth_dataSource.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/login_req_model.dart';
import '../../model/login_response_model.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(AuthInitial()) {
    on<LoadingLoginEvent>((event, emit) => emit(LoginLoadingState()));
    on<ErrorLoginEvent>(_onErrorAuth);
    on<RequestLoginEvent>(_onRequestAuth);
  }

  Future<void> _onRequestAuth(final RequestLoginEvent event, final Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final AuthDataSource dataSource = AuthDataSourceImpl();
    final LoginResponseModel? entity = await dataSource.login(event.loginReqModel);
    if (entity != null) {
      userInfo.setUserData(entity);
      emit(LoginSuccessState(entity));
    } else {
      emit(LoginErrorState("Unable to login"));
    }
  }

  Future<void> _onErrorAuth(final ErrorLoginEvent event, final Emitter<LoginState> emit) async {
    emit(LoginErrorState(event.errorMsg));
  }
}
