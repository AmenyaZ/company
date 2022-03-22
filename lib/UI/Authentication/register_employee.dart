import 'package:company/api/Requests/RegistrationRequest.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/home_page.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';


import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/painting.dart';
import 'package:dio/dio.dart';


class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({Key? key}) : super(key: key);



  @override
  _RegisterEmployeeState createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  var service = NetworkService();
  bool isLoading = false;
  //bool _isHidden = true;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
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

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var passwordVisibility = false;


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
                padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 5),
                // padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: h*0.01,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),

                    )
                ),
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
                              'Create User',
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
                                      content: Text("Enter Full Name"));
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              controller: nameController,

                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your Name here...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF090F13
                                    ),
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
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your email here...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF090F13),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7
                                    ),
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
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your password here...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF090F13),
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
                                      Text("Please confirm your Password"));
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordConfirmationController,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your password here...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF090F13),
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
                    /*
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "User Organizations",
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //Expanded(child: Container(),),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 25, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Expanded(child: Container(),),
                          NewStatefulWidget(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Users Roles",
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //Expanded(child: Container(),),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 25, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Expanded(child: Container(),),
                          MyStatefulWidget(),
                        ],
                      ),
                    ),

                     */
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                      child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Generate Password? ",
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              //Expanded(child: Container(),),
                              SizedBox(width: w * 0.25,),
                              TextButton(
                                  onPressed: () {
                                    loadData();
                                    EasyLoading.show(status: 'Processing');
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var request = RegistrationRequest(
                                        name: nameController.text.toString().trim(),
                                        email: emailController.text.toString().trim(),
                                        password: passwordController.text.toString().trim());

                                    SharedPreferenceHelper().getUserInformation().then((value){
                                      service.UserRegistration(request,value.accessToken!).then((value) {
                                        print("here..........................................................................................");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePageWidget()),
                                        );
                                        EasyLoading.dismiss();
                                        setState(() {
                                          isLoading = false;
                                     });
                                   }).onError((error, stackTrace) {
                                     //  Scaffold.of(context).showSnackBar(
                                     //   SnackBar(content: Text('$error')))
                                     setState(() {
                                       isLoading = false;
                                     });
                                   });
                                 });
                                  },
                                  child: const Text('Register'),
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          const BorderSide(width: 1, color: Colors.transparent)),
                                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(fontSize: 18)))
                              ),

                            ],
                          )

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


//Roles Dropdown
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Select Roles';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
          child: DropdownButton<String>(

            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            style: const TextStyle(color: Color(0xFF090F13),),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Select Roles','One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF090F13),
              ),
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}

//Organizations Dropdown
class NewStatefulWidget extends StatefulWidget {
  const NewStatefulWidget({Key? key}) : super(key: key);

  @override
  State<NewStatefulWidget> createState() => _NewStatefulWidgetState();
}
class _NewStatefulWidgetState extends State<NewStatefulWidget> {
  String newdropdownValue = 'Select Organization';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
            child: DropdownButton<String>(
              value: newdropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,
              style: const TextStyle(color: Color(0xFF090F13),),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
              onChanged: (String? MynewValue) {
                setState(() {
                  newdropdownValue = MynewValue!;
                });
              },
              items: <String>['Select Organization','One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF090F13),
            ),
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}

