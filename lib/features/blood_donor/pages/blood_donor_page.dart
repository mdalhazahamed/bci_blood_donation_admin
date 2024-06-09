import 'package:bci_donation_admin/constants/app_constant.dart';
import 'package:bci_donation_admin/features/blood_donor/blocs/get_blood_donor_bloc/get_blood_donor_bloc.dart';
import 'package:bci_donation_admin/features/blood_donor/model/id_type_req_model.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodDonorPage extends StatefulWidget {
  const BloodDonorPage({super.key});

  @override
  State<BloodDonorPage> createState() => _BloodDonorPageState();
}

class _BloodDonorPageState extends State<BloodDonorPage> {
  GetBloodDonorsBloc getBloodDonorsBloc = GetBloodDonorsBloc();
  @override
  void initState() {
    getBloodDonorsBloc.add(RequestGetBloodDonorsEvent(IdTypeModel()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "BLOOD DONOR",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white, decorationThickness: 1),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Navigation.homePage);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 22),
            BlocBuilder(
                bloc: getBloodDonorsBloc,
                builder: (context, state) {
                  if (state is GetBloodDonorsSuccessState) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.bloodDonorResponseModel.bloodDonors!.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 205, 204, 204),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 45,
                                          child: state.bloodDonorResponseModel.bloodDonors![index].imageId != null
                                              ? Image.network(
                                                  AppConstant.medialUrl + state.bloodDonorResponseModel.bloodDonors![index].imageId.toString())
                                              : Image.asset("assets/images/avater.png"),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${state.bloodDonorResponseModel.bloodDonors![index].firstName} ${state.bloodDonorResponseModel.bloodDonors![index].lastName}",
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              state.bloodDonorResponseModel.bloodDonors![index].bloodGroup,
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppConstant.primaryColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "Address:",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          state.bloodDonorResponseModel.bloodDonors![index].address.toString(),
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Text(
                                          "Contact No.",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 5),
                                        SelectableText(
                                          state.bloodDonorResponseModel.bloodDonors![index].phoneNo.toString(),
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  if (state is GetBloodDonorsErrorState) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Text(state.errorMsg),
                    );
                  }
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}
