
import 'package:company/UI/Authentication/log_in.dart';
import 'package:company/UI/splash_screen/splash_screen.dart';
import 'package:company/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('accessToken');
  //runApp(const MyApp());
  runApp(MaterialApp(home: token == null ? LogIn() : HomePageWidget()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: SplashScreenWidget(),
       builder: EasyLoading.init(),
    );
  }
}