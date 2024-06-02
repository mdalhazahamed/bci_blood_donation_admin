

import 'package:bci_donation_admin/constants/app_constant.dart';
import 'package:bci_donation_admin/features/home/domain/home_enity.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        backgroundColor:   Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "ADMIN PENEL",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              decorationThickness: 1),
        ),
       
       
      ),
     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
                
            children: [
               SizedBox(height: 16),
               Text("Welcome to,", style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                decorationThickness: 1),),
                Text("Blood donation admin penel", style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                decorationThickness: 1),),
          
              SizedBox(height: 30),
             Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, Navigation.bloodBank);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFf2f3f9),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 0.8,
                                    color: Color.fromARGB(255, 226, 225, 225))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 22),
                                  child:
                                      Image.asset("assets/images/blood_bank.png", height: 55),
                                ),
                                Text(
                                  "BLOOD BANK",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                         InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, Navigation.bloodDonor);
                          },
                           child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFf2f3f9),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 0.8,
                                    color: Color.fromARGB(255, 226, 225, 225))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 22),
                                  child:
                                      Image.asset("assets/images/blood_donor.png", height: 55),
                                ),
                                Text(
                                  "BLOOD DONOR",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                                                   ),
                         ),
                           SizedBox(height: 22),
                         InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, Navigation.bloodGroup);
                          },
                           child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFf2f3f9),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 0.8,
                                    color: Color.fromARGB(255, 226, 225, 225))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 22),
                                  child:
                                      Image.asset("assets/images/রক্তদাতা.png", height: 55),
                                ),
                                Text(
                                  "BLOOD GOURP",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                                                   ),
                         ),
                      ],
                    ),
                    
                  ),],
          
                ),
        ),
    ));
  }
}


