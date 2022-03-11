
import 'package:company/UI/Authentication/log_in.dart';
import 'package:company/UI/splash_screen/splash_screen.dart';
import 'package:company/home_page.dart';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const SplashScreenWidget(),
        debugShowCheckedModeBanner:false,
      //home: const SplashScreenWidget(),
        builder: EasyLoading.init()
    );
  }
}