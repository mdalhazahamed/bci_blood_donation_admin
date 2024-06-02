import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';

class BloodBankPage extends StatelessWidget {
  const BloodBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF28844B),
        centerTitle: true,
        title: Text(
          "BLOOD BANK",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, Navigation.addedBloodBank);
                },
                child: Container(
                  height: 55,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFe24065),
                  ),
                  child: Center(
                    child: Text("Add new Blood Bank",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                decorationThickness: 1),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (ctx,index){
              return Padding(
                padding: const EdgeInsets.only(top: 10,right: 16,left: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 205, 204, 204),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Name:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                            SizedBox(width: 5),
                            Text("Dhaka Blood Bank",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height: 2),
                         Row(
                          children: [
                            Text("Address:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                            SizedBox(width: 5),
                            Text("Mohammadpur, Dhaka -1207",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),),
                          ],
                        ),
                         SizedBox(height: 2),
                         Row(
                          children: [
                            Text("Contact No.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                            SizedBox(width: 5),
                            Text("+8801601265012",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300),),
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
