import 'package:bci_donation_admin/route/route_generator.dart';
import 'package:bci_donation_admin/route/routing_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'router/route_generator.dart';
// import 'router/routing_variables.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tangail helpline',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: "DMSans",
        // fontFamily: 'PlusJakarta',
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1,
              fontSizeDelta: 2.0,
              // fontFamily: 'PlusJakarta',
            ),
      ),
      initialRoute: Navigation.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: EasyLoading.init(),
    );
  }
}
