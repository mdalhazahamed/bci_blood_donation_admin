import 'package:bci_donation_admin/features/blood_bank/blocs/getBloodBankBloc/get_bloodbank_bloc.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodBankPage extends StatefulWidget {
  const BloodBankPage({super.key});

  @override
  State<BloodBankPage> createState() => _BloodBankPageState();
}

class _BloodBankPageState extends State<BloodBankPage> {
  GetBloodBankBloc getBloodBankBloc = GetBloodBankBloc();

  @override
  void initState() {
    getBloodBankBloc.add(RequestGetBloodBankEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "BLOOD BANK",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white, decorationThickness: 1),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Navigation.homePage);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Navigation.addedBloodBank);
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFe24065),
                  ),
                  child: Center(
                    child: Text(
                      "Add new Blood Bank",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white, decorationThickness: 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            BlocBuilder(
                bloc: getBloodBankBloc,
                builder: (context, state) {
                  if (state is GetBloodBankSuccessState) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.allBloodBankResponseModel.bloodBanks!.length,
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
                                        Text(
                                          "Name:",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          state.allBloodBankResponseModel.bloodBanks![index].name.toString(),
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Text(
                                          "Address:",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          state.allBloodBankResponseModel.bloodBanks![index].address.toString(),
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
                                        Text(
                                          state.allBloodBankResponseModel.bloodBanks![index].phone.toString(),
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    if (state.allBloodBankResponseModel.bloodBanks![index].mapLink != null &&
                                        state.allBloodBankResponseModel.bloodBanks![index].mapLink != "")
                                      Row(
                                        children: [
                                          Text(
                                            "Map link.",
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            state.allBloodBankResponseModel.bloodBanks![index].mapLink.toString(),
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else if (state is GetBloodBankErrorState) {
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
