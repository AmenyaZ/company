import 'package:company/api/Requests/RegistrationRequest.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/home_page.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordVisibility = false;


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
                          /*
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFFDBE2E7),
                              ),
                            ),
                            child: Icon(
                              Icons.call_rounded,
                              color: Color(0xFF090F13),
                              size: 24,
                            ),
                          ),*/
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
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter Full Name...',
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
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
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter email address here...',
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
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
                              controller: passwordController,
                              //obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter one time password here...',
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                        () => _isObscure = !_isObscure,
                                  ),
                                  child: Icon(
                                    _isObscure ? Icons.visibility_outlined
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
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var request = RegistrationRequest(
                                        email:
                                        emailController.text.toString().trim(),
                                        password: passwordController.text
                                            .toString()
                                            .trim());
                                    service.UserRegistration(request).then((value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HomePageWidget()),
                                      );
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
                    /*
                    Divider(
                      height: 2,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFFDBE2E7),
                    ),*/
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

