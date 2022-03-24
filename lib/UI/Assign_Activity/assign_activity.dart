import 'dart:async';

import 'package:company/api/Response/ListUsers/ListUsersResponse.dart';
import 'package:company/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:company/UI/User/profile_detail.dart';
import 'package:company/api/Requests/OrganizationUserRequest.dart';
import 'package:company/api/Requests/RoleUserRequest.dart';
import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/api/Response/ListOrganization/ListOrganizationResponse.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListRoles/ListRolesResponse.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AssignActivityWidget extends StatefulWidget {
  const AssignActivityWidget({Key? key}) : super(key: key);

  @override
  _AssignActivityWidgetState createState() => _AssignActivityWidgetState();
}
class _AssignActivityWidgetState extends State<AssignActivityWidget> {
  var dropdownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var accessToken = "";
  var service = NetworkService();
  var userdropdownValue;
  var roledropdownValue;
  var orgdropdownValue;
  var userdropdownname="";
  var userdropdownemail= "";
  var organizationid;
  var userid=0;
  var rolesid;
  Timer? timer;
  bool isLoading = false;
  //bool _isHidden = true;
  bool _isObscure = true;
  late double w;
  late double h;



  Future<ListUsersResponse>? userList;
  Future<ListOrganizationResponse>? organizationList;
  Future<ListRolesResponse>? roleList;

  @override
  void initState()  {
    super.initState();
    // EasyLoading.show();
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        email = value.email!;
        username = value.userName!;
        userList = service.UserList(value.accessToken!);
        organizationList = service.OrganizationList(value.accessToken!);
        roleList = service.RoleList(value.accessToken!);
        //organizationUser = service.OrganizationUser(value.accessToken!, OrganizationUserRequest());
        // accessToken = value.accessToken!;
        // print("Print token: ${value.accessToken}");
        // print("Email: ${value.email}");
      });
    });
  }
  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }
  void loadData() async {
    try {
      Future.delayed(const Duration(seconds: 4));
      EasyLoading.show();
      Response response = await Dio().get('https://github.com');
      print(response);
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      // print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children:[
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              userContainer(context),
              activityContent(context),
              button(context)
            ],
          ),

        ],
      ),
    );
  }
  Widget userContainer(context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25)
          ),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Image.asset(
                'assets/images/profile.png',
                width: 90,
                height: 90,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    '${userdropdownname}',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 6),
                  child: Text(
                    '${userdropdownemail}',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFFEE8B60),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );

  }

  Widget activityContent(context){
    return // Generated code for this Column Widget...
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color:Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Users",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )),
                _hintUserDown(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color:Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Organization",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )),
                _hintOrganizationDown(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color:Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Roles",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )),
                _hintRoleDown(),
              ],
            ),
          ),
        ],
      );
  }
  Widget _hintUserDown() => Container(
      width:  600,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),

      ),
      child: FutureBuilder<ListUsersResponse>(builder: (context,snapshot){
        if(snapshot.hasData){
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
            child: DropdownButtonFormField(
              hint: Text('Select User'),
              icon: Icon(
                  Icons.arrow_drop_down
              ),
              iconSize: 30, //this inicrease the size
              alignment: AlignmentDirectional.center,
              elevation: 10,
              style: TextStyle(color: Colors.black),
              onChanged: (newValue) {
                setState(() {
                  userdropdownValue = newValue;
                  userdropdownname = userdropdownValue.attributes!.name!;
                  userdropdownemail = userdropdownValue.attributes!.email!;
                  userid = userdropdownValue.id!;
                });
                print(snapshot.data!.users!.indexOf(userdropdownValue));
                print(userdropdownValue.id!);
                print(userdropdownValue.attributes!.name!);

              },
              items: snapshot.data!.users!
                  .map<DropdownMenuItem<Users>>((Users value) {
                return DropdownMenuItem<Users>(
                  value: value,
                  child: Text(value.attributes!.name!),
                );
              }).toList(),

            ),
          );

        }
        return Padding(
          padding: const EdgeInsets.only(left:  10.0, top: 10.0, bottom: 2.0),
          child: Text(
              "Please Wait ...",
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              )

          ),
        );
      },future: userList,)
  );
  Widget _hintOrganizationDown() => Container(
      width:  600,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),

      ),
      child:  FutureBuilder<ListOrganizationResponse>(builder: (context,snapshot){
        if(snapshot.hasData){
          return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
              child: DropdownButtonFormField(

                hint: Text('Select Organization'),
                icon: Icon(
                    Icons.arrow_drop_down
                ),
                iconSize: 30, //this inicrease the size
                alignment: AlignmentDirectional.center,
                elevation: 10,
                style: TextStyle(color: Colors.black),
                // this is for underline
                // to give an underline us this in your underline inspite of Container
                //       Container(
                //         height: 2,
                //         color: Colors.grey,
                //       )
                // value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    orgdropdownValue = newValue;
                    organizationid = orgdropdownValue.id!;
                  });
                  print(orgdropdownValue.id!);
                },
                items: snapshot.data!.organizations!
                    .map<DropdownMenuItem<Organizations>>((Organizations value) {
                  return DropdownMenuItem<Organizations>(
                    value: value,
                    child: Text(value.attributes!.name!),
                  );
                }).toList(),
              )

          );
        }
        return Padding(
          padding: const EdgeInsets.only(left:  10.0, top: 10.0, bottom: 2.0),
          child: Text(
              "Please Wait ...",
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              )

          ),
        );
      },future: organizationList,)

  );
  Widget _hintRoleDown() => Container(
      width:  600,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),

      ),
      child:  FutureBuilder<ListRolesResponse>(builder: (context,snapshot){
        if(snapshot.hasData){
          return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
              child: DropdownButtonFormField(
                hint: Text('Select Role'),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30, //this inicrease the size
                alignment: AlignmentDirectional.center,
                elevation: 10,
                style: TextStyle(color: Colors.black),
                // this is for underline
                // to give an underline us this in your underline inspite of Container
                //       Container(
                //         height: 2,
                //         color: Colors.grey,
                //       )
                onChanged: (newValue) {
                  setState(() {
                    roledropdownValue = newValue;
                    rolesid = roledropdownValue.id!;
                  });
                  print(snapshot.data!.role!.indexOf(roledropdownValue));
                  print(roledropdownValue.id!);
                },
                items: snapshot.data!.role!
                    .map<DropdownMenuItem<Role>>((value) {
                  return DropdownMenuItem<Role>(
                    value: value,
                    child: Text(value.attributes!.title!),
                  );
                }).toList(),
              )
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left:  10.0, top: 10.0, bottom: 2.0),
          child: Text(
              "Please Wait ...",
              style: TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              )

          ),
        );
      },future: roleList,)

  );
  Widget button(context){
    return DialogButton(
      width: 150,
      onPressed: () {
        loadData();
        EasyLoading.show(status: 'Processing');
        setState(() {
          isLoading = true;
        });
        var orgrequest = OrganizationUserRequest(
          organizationId: organizationid?.toString().trim(),
          userId: userid.toString().trim(),
        );
        var rolerequest = RoleUserRequest(
          roleId: rolesid?.toString().trim(),
          userId: userid.toString().trim(),
        );
        SharedPreferenceHelper().getUserInformation().then((value){
          service.OrganizationUser(orgrequest, value.accessToken!).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePageWidget()),
            );
            final snack = SnackBar(
              padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
              content: Text(
                'Saved Succesfully',
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
          }).onError((error, stackTrace) {
            final snack = SnackBar(
              padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
              content: Text(
                'Organization not Selected',
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

        SharedPreferenceHelper().getUserInformation().then((value) {
          service.RoleUser(rolerequest, value.accessToken!).then((value){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePageWidget()),
            );
            final snack = SnackBar(
              padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
              content: Text(
                'Saved Succesfully',
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
          }).onError((error, stackTrace) {
            final snack = SnackBar(
              padding: EdgeInsetsDirectional.only( top: 20, bottom: 20),
              content: Text(
                'Role Not Selected',
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
        "Save Info",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      radius: BorderRadius.all(Radius.circular(16)),
    );
  }


  Widget _hintDown() => Container(
    width:  600,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),

      ),
      child: Padding(
          padding: EdgeInsets.all(5.0),
          child: DropdownButton(
            hint: Text('Select User'),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 30, //this inicrease the size
            alignment: AlignmentDirectional.center,
            elevation: 10,
            style: TextStyle(color: Colors.black),
            // this is for underline
            // to give an underline us this in your underline inspite of Container
            //       Container(
            //         height: 2,
            //         color: Colors.grey,
            //       )
            underline: Container(
              margin: EdgeInsets.only(left:  80, right: 80),
            ),
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Choose the id proof!', 'Adhaar Card', 'Pancard', 'Voter card', 'Passport']
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
      )
  );


}
