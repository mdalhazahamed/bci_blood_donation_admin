import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';

class BloodGroupPage extends StatelessWidget {
  const BloodGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:   Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "BLOOD GOURPS",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              decorationThickness: 1),
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
      body: Center(
        child: Text("Blood Group"),
      ),
    );
  }
}