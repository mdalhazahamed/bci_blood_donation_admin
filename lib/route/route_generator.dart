import 'package:bci_donation_admin/features/athentications/pages/login_page.dart';
import 'package:bci_donation_admin/features/blood_bank/pages/added_blood_bank.dart';
import 'package:bci_donation_admin/features/home/home_page.dart';
import 'package:bci_donation_admin/features/home/pages/blood_donor_page.dart';
import 'package:bci_donation_admin/features/home/pages/blood_group_page.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';

import '../features/blood_bank/pages/blood_bank_page.dart';
import '../features/startup/startup_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Navigation.startup:
        return MaterialPageRoute(builder: (_) => StartUpPage());
      case Navigation.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Navigation.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Navigation.addedBloodBank:
        return MaterialPageRoute(builder: (_) => AddedBloodBankPage());
      // case Navigation.signUp:
      //   return MaterialPageRoute(builder: (_) => SignUpPage());

      //blood
      case Navigation.bloodDonor:
        return MaterialPageRoute(builder: (_) => BloodDonorPage());
      case Navigation.bloodBank:
        return MaterialPageRoute(builder: (_) => BloodBankPage());
      case Navigation.bloodGroup:
        return MaterialPageRoute(builder: (_) => BloodGroupPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
