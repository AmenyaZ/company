
import 'dart:async';
import 'dart:io';

import 'package:company/UI/Assign_Activity/assign_activity.dart';
import 'package:company/UI/Authentication/log_in.dart';
import 'package:company/UI/Authentication/register_employee.dart';
import 'package:company/UI/Company/company_list.dart';
import 'package:company/UI/User/profile_detail.dart';
import 'package:company/UI/User/users_list.dart';
import 'package:company/UI/roles/roles_list.dart';
import 'package:company/UI/settings/settings.dart';
import 'package:company/api/Requests/OrganizationUserRequest.dart';
import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/api/Response/ListOrganizationResponse.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListRolesResponse.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/api/Response/ListUsersResponse.dart';
import 'package:company/api/Response/OrganizationUser/OrganizationUserResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({ Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  var email = "";
  var username = "";
  var userId = "";
  var organizationId = "";
  var rolesId = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var accessToken = "";
  var service = NetworkService();
  var userdropdownValue;
  var roledropdownValue;
  var orgdropdownValue;
  var userdropdownname;
  var userdropdownemail;
  var organizationid;
  var userid;
  Timer? timer;
  bool isLoading = false;
  //bool _isHidden = true;
  bool _isObscure = true;


  Future<ListUsersResponse>? userList;
  Future<ListOrganizationResponse>? organizationList;
  Future<ListRolesResponse>? roleList;
  //Future<OrganizationUserResponse>? organizationUser;

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
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () {
                // exit(0);
                Navigator.of(context).pop(true);
              },
              //return true when click on "Yes"
              child:Text('Yes'),
            ),
          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          title: Text(" "),
          //backgroundColor: Color(0xFFF5F5F5)
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Drawer
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x4B1A1F24),
                            offset: Offset(0, 2),
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.blue, Color(0xFFF2A384)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(0.94, -1),
                          end: AlignmentDirectional(-0.94, 1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(

                                  child: Column(
                                    children: [
                                      Text(
                                        'Total Tasks',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 15),
                                        child: Text(
                                          '7,630',
                                          style: TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),

                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Completed',
                                        style:TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 15),
                                        child: Text(
                                          '700',
                                          style:TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x39000000),
                            offset: Offset(0, -1),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Quick Service',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    loadData();
                                    await Future.delayed(Duration(seconds: 2));
                                    EasyLoading.show(status: 'loading...');
                                    await Future.delayed(Duration(seconds: 5));
                                    EasyLoading.dismiss();
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x3B000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_comment_outlined,
                                            color: Color(0xFF1E2429),
                                            size: 40,
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Add Task',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _openEditPopup(context);
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x3A000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.stacked_line_chart_rounded,
                                            color: Color(0xFF1E2429),
                                            size: 40,
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Activity',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const CompanyListWidget()),
                                    );
                                  },
                                  child: Container(
                                    width: 110,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0x39000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.account_balance_outlined,
                                            color: Color(0xFF1E2429),
                                            size: 40,
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Text(
                                              'Organizations',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'MyTasks',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.92,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F5F7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0x6639D2C0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Icon(
                                        Icons.monetization_on_rounded,
                                        color: Color(0xFF39D2C0),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'File Attendance Reports',
                                          style:TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF1E2429),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Income',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Hello World',
                                          textAlign: TextAlign.end,
                                          style:TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Create Checklist',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Go Far Rewards',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Create Checklist',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Go Far Rewards',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Create Checklist',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Go Far Rewards',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.monetization_on_rounded,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Create Checklist',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0x6639D2C0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Icon(
                                          Icons.task,
                                          color: Color(0xFF39D2C0),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Go Far Rewards',
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 0, 0),
                                            child: Text(
                                              'Income',
                                              style: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[200],
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.

          child: ListView(
            // Important: Remove any padding from the ListView.

            padding: EdgeInsets.zero,
            children: [

              UserAccountsDrawerHeader(

                currentAccountPicture: InkWell(
                  onTap: ()
                  {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ProfileDetailWidget()));
                  },
                  child: CircleAvatar(

                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                  ),
                ),
                otherAccountsPictures: [
                  IconButton(
                    onPressed: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('accessToken');
                      loadData();
                      EasyLoading.show(status: 'Logging Out...');
                      Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        MaterialPageRoute(
                          builder: (BuildContext context) => LogIn(),
                        ),
                            (Route route) => false,
                      );
                      EasyLoading.dismiss();
                    },
                    icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.redAccent,
                        size: 30
                    ),
                  )
                ],
                accountEmail: Text(email),
                accountName: Text(
                  username,
                  style: TextStyle(fontSize: 24.0),
                ),

                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),

              ),
              ListTile(
                title: Text("Home"),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePageWidget()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Companies"),
                leading: IconButton(
                  icon: Icon(Icons.business),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CompanyListWidget()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Roles"),
                leading: IconButton(
                  icon: Icon(Icons.build_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => RolesList()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Users"),
                leading: IconButton(
                  icon: Icon(Icons.person_outline_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserListWidget()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),/*
              ListTile(
                title: Text("Register User"),
                leading: IconButton(
                  icon: Icon(Icons.person_add),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => RegisterEmployee()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              */
              ListTile(
                title: Text("Settings"),
                leading: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                onTap: ()
                {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SettingsScreen()));
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              //SizedBox(height: 300,),
              ListTile(
                title: Text('App version 1.0.0'),
                onTap: () {},
              ),

            ],
          ),

        ),
      ),
    );
  }
  _openEditPopup(context) {
    Alert(
        context: context,
        image: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.fitWidth,
          width: 100,
          height: 100,
        ),

        title: userdropdownname,
        desc: userdropdownemail,
        content:  Container(
          width: 800,
          child: activityContent(context)
        ),
        buttons: [
          DialogButton(
            width: 150,
            onPressed: () {
              loadData();
              EasyLoading.show(status: 'Processing');
              setState(() {
                isLoading = true;
              });
              var request = OrganizationUserRequest(
                organizationId: organizationId.toString(),
                userId: userid.toString(),
              );
              SharedPreferenceHelper().getUserInformation().then((value){
                service.OrganizationUser(request, value.accessToken!).then((value) {
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
            child: Text(
              "Save Info",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
        ]).show();
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
                userid = snapshot.data!.users!.indexOf(userdropdownValue);
                });
                print(snapshot.data!.users!.indexOf(userdropdownValue));
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
                    organizationid = snapshot.data!.organizations!.indexOf(orgdropdownValue);
                  });
                  print(snapshot.data!.organizations!.indexOf(orgdropdownValue));
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
                  });
                  print(snapshot.data!.role!.indexOf(roledropdownValue));
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
  Widget myList(context){
    return Expanded(
      child: FutureBuilder<ListUsersResponse>(
          future: userList,
          builder: (context, snapshot){
             // itemCount: snapshot.data!.users!.length,
             // itemBuilder: (context, index){
                print("list${snapshot.data!.users!.toString()}");
                return Text("${snapshot.data!.toJson()}");
                //getUserList(context, snapshot.data!.users![index]);
              }

      ),
    );

  }


}
