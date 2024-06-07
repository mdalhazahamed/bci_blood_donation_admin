import 'package:bci_donation_admin/constants/app_constant.dart';
import 'package:bci_donation_admin/features/athentications/model/login_req_model.dart';
import 'package:bci_donation_admin/features/athentications/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../core/utils/toast.dart';
import '../home/pages/added_page/added_blood_bank.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginReqModel loginReqModel = LoginReqModel();
  TextEditingController regFirstNameEditor = TextEditingController();
  TextEditingController regPasswordEditor = TextEditingController();

  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFedf3ff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18, top: 110),
            child: Column(
              children: [
                Image.asset("assets/images/app_icon.png", height: 300),
                //SizedBox(height: 16),
                CustomTextFieldWidget(
                  textEditingController: regFirstNameEditor,
                  text: "Username",
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
                SizedBox(height: 16),
                CustomTextFieldWidget(
                  textEditingController: regPasswordEditor,
                  isObscure: true,
                  borderColor: AppConstant.neutral40,
                  text: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget password",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppConstant.secondaryColor),
                    ),
                  ),
                ),

                SizedBox(height: 24),
                BlocListener(
                  bloc: loginBloc,
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      toastMsg("Successfully logged in");
                      Navigator.pushReplacementNamed(context, Navigation.homePage);
                    }
                  },
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    loginReqModel.userId = regFirstNameEditor.text.trim();
                    loginReqModel.password = regPasswordEditor.text.trim();
                    loginBloc.add(RequestLoginEvent(loginReqModel));

                    // Navigator.pushReplacementNamed(context, Navigation.homePage);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppConstant.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Navigation.signUp);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5, color: Color.fromARGB(255, 206, 206, 206))),
                    child: Center(
                      child: Text(
                        "Sign Up Instead",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
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
      ),
    );
  }
}
