import 'dart:async';

import 'package:bci_donation_admin/features/blood_bank/dataSource/bloodbank_dataSource.dart';
import 'package:bci_donation_admin/features/blood_bank/model/blood_bank_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_bloodbank_event.dart';
part 'add_bloodbank_state.dart';

class AddBloodBankBloc extends Bloc<AddBloodBankEvent, AddBloodBankState> {
  AddBloodBankBloc() : super(AuthInitial()) {
    on<LoadingAddBloodBankEvent>((event, emit) => emit(AddBloodBankLoadingState()));
    on<ErrorAddBloodBankEvent>(_onErrorAuth);
    on<RequestAddBloodBankEvent>(_onRequestAuth);
  }

  Future<void> _onRequestAuth(final RequestAddBloodBankEvent event, final Emitter<AddBloodBankState> emit) async {
    emit(AddBloodBankLoadingState());
    final BloodBankDataSource dataSource = BloodBankDataSourceImpl();
    final BloodBankModel? entity = await dataSource.addBloodBank(event.bloodBankModel);
    if (entity != null) {
      emit(AddBloodBankSuccessState(entity));
    } else {
      emit(AddBloodBankErrorState("Unable to add blood bank"));
    }
  }

  Future<void> _onErrorAuth(final ErrorAddBloodBankEvent event, final Emitter<AddBloodBankState> emit) async {
    emit(AddBloodBankErrorState(event.errorMsg));
  }
}
