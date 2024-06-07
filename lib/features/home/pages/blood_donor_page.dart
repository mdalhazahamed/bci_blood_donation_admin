import 'package:bci_donation_admin/constants/app_constant.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';

class BloodDonorPage extends StatelessWidget {
  const BloodDonorPage({super.key});

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
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRy5QMODyHm-LaMpgXOqMIUHPbQ-Y51jAZR_UJYC-9Dv1IL3ovh"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mohammad Alhaz Ahammed",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "AB+",
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
                                  "Mohammadpur, Dhaka -1207",
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
                                  "+8801601265012",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
