import 'package:company/UI/Authentication/log_in.dart';
import 'package:company/home_page.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EntryApp extends StatefulWidget {

  @override
  _EntryAppState createState() => _EntryAppState();
}

class _EntryAppState extends State<EntryApp> {
  bool isUserSignedIn = false;
  var accessToken = "";

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }
  //check user login status
  Future<String> _checkLoginStatus() async {
    return SharedPreferenceHelper().getUserInformation().then((value){
      return Future.delayed(Duration(milliseconds: 200), () {
        accessToken = value.accessToken!;

        if (accessToken.isNotEmpty) {
          if (mounted) {
            setState(() {
              isUserSignedIn = true;
            });
          }
        }
        return accessToken;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return const LogIn();
          } else {
            return HomePageWidget();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

