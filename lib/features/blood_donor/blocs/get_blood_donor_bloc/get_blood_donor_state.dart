part of 'get_blood_donor_bloc.dart';

@immutable
abstract class GetBloodDonorsState {}

class AuthInitial extends GetBloodDonorsState {}

class GetBloodDonorsErrorState extends GetBloodDonorsState {
  final String errorMsg;
  GetBloodDonorsErrorState(this.errorMsg);
}

class GetBloodDonorsLoadingState extends GetBloodDonorsState {
  GetBloodDonorsLoadingState();
}

class GetBloodDonorsSuccessState extends GetBloodDonorsState {
  final BloodDonorResponseModel bloodDonorResponseModel;
  GetBloodDonorsSuccessState(this.bloodDonorResponseModel);
}
