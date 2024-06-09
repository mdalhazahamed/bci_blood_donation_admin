import 'package:bci_donation_admin/constants/app_constant.dart';
import 'package:bci_donation_admin/core/utils/toast.dart';
import 'package:bci_donation_admin/features/blood_bank/blocs/addBloodBankBloc/add_bloodbank_bloc.dart';
import 'package:bci_donation_admin/features/blood_bank/model/blood_bank_model.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedBloodBankPage extends StatefulWidget {
  const AddedBloodBankPage({super.key});

  @override
  State<AddedBloodBankPage> createState() => _AddedBloodBankPageState();
}

class _AddedBloodBankPageState extends State<AddedBloodBankPage> {
  AddBloodBankBloc addBloodBankBloc = AddBloodBankBloc();

  TextEditingController nameEditor = TextEditingController();
  TextEditingController regNumberEditor = TextEditingController();
  TextEditingController regAddressEditor = TextEditingController();
  TextEditingController regMapEditor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "Add Blood Bank",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white, decorationThickness: 1),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Navigation.bloodBank);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 22),
              CustomTextFieldWidget(
                textEditingController: nameEditor,
                text: "Name",
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              SizedBox(height: 16),
              CustomTextFieldWidget(
                textEditingController: regAddressEditor,
                text: "Present Address",
                icon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              SizedBox(height: 16),
              CustomTextFieldWidget(
                textEditingController: regNumberEditor,
                keyboardType: TextInputType.number,
                text: "Phone No",
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              SizedBox(height: 16),
              CustomTextFieldWidget(
                textEditingController: regMapEditor,
                keyboardType: TextInputType.number,
                text: "Map link",
                icon: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              SizedBox(height: 22),
              BlocListener(
                bloc: addBloodBankBloc,
                listener: (context, state) {
                  if (state is AddBloodBankSuccessState) {
                    toastMsg("Successfully added blood bank!");
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, Navigation.bloodBank);
                  }
                },
                child: Container(),
              ),
              InkWell(
                onTap: () {
                  BloodBankModel bloodBankModel = BloodBankModel();
                  bloodBankModel.activeYn = "Y";
                  bloodBankModel.name = nameEditor.text;
                  bloodBankModel.address = regAddressEditor.text;
                  bloodBankModel.phone = regNumberEditor.text;
                  bloodBankModel.mapLink = regMapEditor.text;

                  addBloodBankBloc.add(RequestAddBloodBankEvent(bloodBankModel));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppConstant.primaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final Color? borderColor;

  CustomTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.text,
    required this.icon,
    this.keyboardType,
    this.isObscure,
    this.borderColor,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        // maxLines: 10,
        //minLines: 1,
        obscureText: isObscure ?? false,
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0.5,
              color: borderColor ?? AppConstant.primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                width: 0.5,
                color: AppConstant.primaryColor,
              )),
          labelText: text,
          labelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
