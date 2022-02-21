import 'package:company/api/Requests/LoginRequest.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/home_page.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/painting.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/Response/LogInResponse.dart';
import '../../local/local_user.dart';



class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var service = NetworkService();
  //bool isLoading = false;
  //bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    EasyLoading.init();
    // EasyLoading.show();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  void loadData() async {
    try {
      EasyLoading.show();
      Response response = await Dio().get('https://github.com');
      print(response);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordVisibility = false;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Future<LocalUser> saveUserOffline(LogInResponse value) async {
      var localUser = LocalUser(
          email: value.user?.email,
          password: passwordController.text.toString().trim(),
          accessToken: value.accessToken,
          id: "${value.user!.id!}");
      await SharedPreferenceHelper()
          .saveUserInformation(localUser)
          .whenComplete(() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageWidget()),
      ));
      return localUser;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 150, 50, 50),
              // padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 240,
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.07,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                const SnackBar(
                                    content: Text("Please enter your Email"));
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter your email here...',
                              hintStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            ),
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF2B343A),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                const SnackBar(
                                    content:
                                    Text("Please enter your Password"));
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter your password here...',
                              hintStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () =>
                                  passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF2B343A),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(

                            text: TextSpan(
                              text: "Forgot Password? ",
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //Expanded(child: Container(),),
                          //SizedBox(width: w * 0.3,),
                          MaterialButton(
                            color: Colors.blueAccent,
                            onPressed: () async {
                              loadData();
                              await Future.delayed(Duration(seconds: 2));
                              EasyLoading.show(status: 'loading...');
                              await Future.delayed(Duration(seconds: 3
                              ));
                              //EasyLoading.dismiss();

                              var request = LoginRequest(
                                  email:
                                  emailController.text.toString().trim(),
                                  password: passwordController.text
                                      .toString()
                                      .trim());
                              SharedPreferenceHelper().getUserInformation().then((local){
                              service.UserLogIn(request).then((value) {
                                saveUserOffline(value);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePageWidget()),
                                );
                                EasyLoading.dismiss();
                                final snack = SnackBar(
                                  padding: EdgeInsetsDirectional.only(start: 30, top: 0, end: 30, bottom: 20),
                                  content: Text('Login Succesful'),
                                  duration: Duration(seconds: 4),
                                  action: SnackBarAction(
                                    label: 'Success',
                                    textColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snack);
                              }).onError((error, stackTrace) {
                                //  Scaffold.of(context).showSnackBar(
                                //   SnackBar(content: Text('$error')));
                                print(error);
                              });
                              });
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      )

                  ),
                  /*
                  Divider(
                    height: 2,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xFFDBE2E7),
                  ),*/
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: w * 0.26,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Having Trouble? Contact admin",
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.04,
                            ),
                            Icon(Icons.mail)
                            //Expanded(child: Container(),),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
