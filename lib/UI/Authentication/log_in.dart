import 'package:company/api/Requests/LoginRequest.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/home_page.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/painting.dart';
import 'package:dio/dio.dart';
import '../../api/Response/Login/LogInResponse.dart';
import '../../local/local_user.dart';



class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVisibility = false;
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


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
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,

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
                              await Future.delayed(const Duration(seconds: 2));
                              EasyLoading.show(status: 'loading...');
                              await Future.delayed(Duration(seconds: 5));
                              //EasyLoading.dismiss();

                              var request = LoginRequest(
                                  email: emailController.text.toString().trim(),
                                  password: passwordController.text
                                      .toString()
                                      .trim());
                              service.UserLogIn(request).then((value) async{
                                //print(value.toJson());
                                await saveUserOffline(value);

                                final snack = SnackBar(

                                  padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
                                  content: Text(
                                      'Login Succesful',
                                    textAlign: TextAlign.center,
                                  ),
                                  width: w*0.2,
                                  duration: Duration(seconds: 5),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                );
                                EasyLoading.dismiss();
                                ScaffoldMessenger.of(context).showSnackBar(snack);
                              }).onError((error, stackTrace) {
                                //  Scaffold.of(context).showSnackBar(
                                print("${error}");
                                final snack = SnackBar(
                                  padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
                                  content: Text(
                                      'Login failed, Try Again',
                                    textAlign: TextAlign.center,
                                  ),
                                  width: w*0.2,
                                  duration: Duration(seconds: 5),
                                  action: SnackBarAction(
                                    label: '',
                                    textColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                );
                                EasyLoading.dismiss();
                                ScaffoldMessenger.of(context).showSnackBar(snack);
                              });
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      )

                  ),
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
  Future<LocalUser> saveUserOffline(LogInResponse value) async {
    var localUser = LocalUser(
      userName: value.user!.name!,
        email: value.user?.email,
        password: passwordController.text.toString().trim(),
        accessToken: value.accessToken,
        id: "${value.user!.id!}");
   print(localUser.accessToken);
    await SharedPreferenceHelper()
        .saveUserInformation(localUser)
    .then((value){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageWidget()),
      );
    }).onError((error, stackTrace){
      print(error);
    });
    return localUser;
  }

}

