import 'package:company/Company/company_list.dart';
import 'package:company/Company/company_profile.dart';
import 'package:company/drawer/drawer.dart';
import 'package:company/home_page.dart';
import 'package:company/Authentication/log_in.dart';
import 'package:company/Authentication/register_employee.dart';
import 'package:company/splash_screen/splash_screen.dart';
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
      home: HomePageWidget( )


    );
  }
}