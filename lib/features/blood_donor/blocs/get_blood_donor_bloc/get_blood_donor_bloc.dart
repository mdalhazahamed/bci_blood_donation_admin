import 'dart:async';

import 'package:bci_donation_admin/features/blood_donor/datasource/bloodDonor_dataSource.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/donor_res_model.dart';
import '../../model/id_type_req_model.dart';

part 'get_blood_donor_event.dart';

part 'get_blood_donor_state.dart';

class GetBloodDonorsBloc extends Bloc<GetBloodDonorsEvent, GetBloodDonorsState> {
  GetBloodDonorsBloc() : super(AuthInitial()) {
    on<LoadingGetBloodDonorsEvent>((event, emit) => emit(GetBloodDonorsLoadingState()));
    on<ErrorGetBloodDonorsEvent>(_onErrorAuth);
    on<RequestGetBloodDonorsEvent>(_onRequestAuth);
  }

  Future<void> _onRequestAuth(final RequestGetBloodDonorsEvent event, final Emitter<GetBloodDonorsState> emit) async {
    emit(GetBloodDonorsLoadingState());
    final BloodDonorDataSource dataSource = BloodDonorDataSourceImpl();
    final BloodDonorResponseModel? entity = await dataSource.getBloodDonors(event.idTypeModel);
    if (entity != null) {
      emit(GetBloodDonorsSuccessState(entity));
    } else {
      emit(GetBloodDonorsErrorState("Unable to Get BloodDonors"));
    }
  }

  Future<void> _onErrorAuth(final ErrorGetBloodDonorsEvent event, final Emitter<GetBloodDonorsState> emit) async {
    emit(GetBloodDonorsErrorState(event.errorMsg));
  }
}
