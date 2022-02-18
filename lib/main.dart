
import 'package:company/UI/splash_screen/splash_screen.dart';
import 'package:company/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
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