import 'package:company/UI/roles/roles_list.dart';
import 'package:company/api/Requests/CreateRoleRequest.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter/painting.dart';

class CreateRoleWidget extends StatefulWidget {
  const CreateRoleWidget({Key? key}) : super(key: key);

  @override
  _CreateRoleWidgetState createState() => _CreateRoleWidgetState();
}

class _CreateRoleWidgetState extends State<CreateRoleWidget> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  bool isLoading = false;
  var service = NetworkService();

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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 80,),
            logoIcon(context),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Role',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF14181B),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
            ),
            roleTitle(context),
            describeRole(context),
            saveButton(context)
          ],
        ),
      ),
    );
  }
  Widget logoIcon(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // color: Color(0xFFDBE2E7),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: Container(
              width: 90,
              height: 90,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget roleTitle(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
      child: TextFormField(
        controller: titleController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Title',
          labelStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'Enter Role Title...',
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
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Color(0xFF14181B),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
  Widget describeRole(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
      child: TextFormField(
        controller: descriptionController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF95A1AC),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          hintText: 'More Details about Role...',
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
          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
        ),
        style: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Color(0xFF14181B),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.start,
        maxLines: 3,
      ),
    );
  }
  Widget saveButton(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Align(
      alignment: AlignmentDirectional(0, 0.05),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: DialogButton(
            width: 200,
            onPressed: () {
              Navigator.of(context).pop();
              loadData();
              EasyLoading.show(status: 'Processing');
              setState(() {
                isLoading = true;
              });
              var request = CreateRoleRequest(
                  title: titleController.text.toString().trim(),
                  description: descriptionController.text.toString().trim()
              );
              /*
              SharedPreferenceHelper().getUserInformation().then((value){
                print(value.accessToken);
                service.CreateRole(request, "${value.accessToken}").then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>RolesList()),
                  );
                  EasyLoading.dismiss();
                });
              });

               */
              SharedPreferenceHelper().getUserInformation().then((value){
                service.CreateRole(request, value.accessToken!).then((value) {
                  final snack = SnackBar(
                    padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
                    content: Text(
                      'Role Saved Succesfully',
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
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RolesList()),
                  );
                }).onError((error, stackTrace) {
                  final snack = SnackBar(
                    padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
                    content: Text(
                      'Failed',
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
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                  setState(() {
                    isLoading = false;
                  });
                });
              });

            },
            child: Text(
              "Add Role",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
      ),
    );

  }

}
