import 'package:bci_donation_admin/features/athentications/login_page.dart';
import 'package:bci_donation_admin/features/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../core/data_manager.dart';
import '../../core/user_info.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _configureRoute();
  }

  void _configureRoute() async {
    final dataManager = DataManager();
    final String token = await dataManager.getAuthToken();
    final String dob = await dataManager.getDOB();
    final String userName = await dataManager.getUsername();
    final String name = await dataManager.getName();
    final String id = await dataManager.getID();
    final String profileUrl = await dataManager.getProfileUrl();

    if (token.isNotEmpty) {
      setState(() {
        userInfo.authToken = token;
        userInfo.userBirthDay = dob;
        userInfo.username = userName;
        userInfo.name = name;
        userInfo.id = id;
        userInfo.autoLogin = true;
        userInfo.profileImgUrl = profileUrl;
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFedf3ff),
      body: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
