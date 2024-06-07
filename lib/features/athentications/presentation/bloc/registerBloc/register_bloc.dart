import 'dart:async';

import 'package:bci_donation_admin/features/athentications/datasource/auth_dataSource.dart';
import 'package:bci_donation_admin/features/athentications/model/reg_req_model.dart';
import 'package:bci_donation_admin/features/athentications/model/reg_res_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(AuthInitial()) {
    on<LoadingRegisterEvent>((event, emit) => emit(RegisterLoadingState()));
    on<ErrorRegisterEvent>(_onErrorAuth);
    on<RequestRegisterEvent>(_onRequestAuth);
  }

  Future<void> _onRequestAuth(final RequestRegisterEvent event, final Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    final AuthDataSource dataSource = AuthDataSourceImpl();
    final RegistrationResponseModel? entity = await dataSource.register(event.registrationReqModel);
    if (entity != null) {
      emit(RegisterSuccessState(entity));
    } else {
      emit(RegisterErrorState("Unable to login"));
    }
  }

  Future<void> _onErrorAuth(final ErrorRegisterEvent event, final Emitter<RegisterState> emit) async {
    emit(RegisterErrorState(event.errorMsg));
  }
}
