import 'dart:async';

import 'package:bci_donation_admin/features/blood_bank/dataSource/bloodbank_dataSource.dart';
import 'package:bci_donation_admin/features/blood_bank/model/all_bloodbank_res_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_bloodbank_event.dart';
part 'get_bloodbank_state.dart';

class GetBloodBankBloc extends Bloc<GetBloodBankEvent, GetBloodBankState> {
  GetBloodBankBloc() : super(AuthInitial()) {
    on<LoadingGetBloodBankEvent>((event, emit) => emit(GetBloodBankLoadingState()));
    on<ErrorGetBloodBankEvent>(_onErrorAuth);
    on<RequestGetBloodBankEvent>(_onRequestAuth);
  }

  Future<void> _onRequestAuth(final RequestGetBloodBankEvent event, final Emitter<GetBloodBankState> emit) async {
    emit(GetBloodBankLoadingState());
    final BloodBankDataSource dataSource = BloodBankDataSourceImpl();
    final AllBloodBankResponseModel? entity = await dataSource.getBloodBanks();
    if (entity != null) {
      emit(GetBloodBankSuccessState(entity));
    } else {
      emit(GetBloodBankErrorState("Unable to add blood bank"));
    }
  }

  Future<void> _onErrorAuth(final ErrorGetBloodBankEvent event, final Emitter<GetBloodBankState> emit) async {
    emit(GetBloodBankErrorState(event.errorMsg));
  }
}
