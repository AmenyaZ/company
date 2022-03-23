import 'package:company/UI/User/profile_detail.dart';
import 'package:company/UI/User/profile_detail.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListUsers/Organizations.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/api/Response/ListUsers/ListUsersResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'edit_profile.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({Key? key, required this.usersResponse}) : super(key: key);
  final Users usersResponse;
  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}


class _UserProfileWidgetState extends State<UserProfileWidget> {
  var email = "";
  var username = "";
  var role = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var service = NetworkService();

  @override
  void initState()  {
    super.initState();
    // EasyLoading.show();
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        email = value.email!;
        username = value.userName!;
        // accessToken = value.accessToken!;
        // print("Print token: ${value.accessToken}");
        // print("Email: ${value.email}");
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              profileHeader(context),
              const SizedBox(height: 10.0),
              usersContent(context),

            ],
          ),
        ));
  }
  Widget profileHeader(BuildContext context){
    return ProfileHeader(
      avatar: NetworkImage('https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
      coverImage: AssetImage('assets/images/card2.jpg'),
      title: "${widget.usersResponse.attributes!.name}",
      subtitle: "${widget.usersResponse.attributes!.email}",
      actions: <Widget>[
        MaterialButton(
          color: Colors.white,
          shape: CircleBorder(),
          elevation: 0,
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const EditProfileWidget()),
            );
          },
        )
      ],
    );
  }
  Widget usersContent(BuildContext context) {

    double length = widget.usersResponse.relationships!.roles!.length.toDouble();
    double orgLength = widget.usersResponse.relationships!.organizations!.length.toDouble();
    print(length);
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15) ,
          ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
              alignment: Alignment.topCenter,
              child: Card(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(7, 3, 7, 3),
                  child: Text(
                    "User Information",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2-20,

                  child: Column(
                    children: [
                      Card(
                  color: Colors.grey.shade100,
                          child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(7, 3, 7, 3),
                        child: Text("My Organizations"),
                      )),
                    ],
                  ),
                ),
                //SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                Container(
                  width: MediaQuery.of(context).size.width/2-20,
                  child: Column(
                    children: [
                      Card(
                          color: Colors.grey.shade100,
                          child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(7, 3, 7, 3),
                        child: Text("My Roles"),
                      )),

                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/2-20,
                  child: Card(
                    color: Colors.grey.shade100,
                    child: Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                          shrinkWrap: true,itemCount:orgLength.toInt(),itemBuilder: (context,index){
                        return getOrganizationList(context, widget.usersResponse.relationships!.organizations![index]);
                      }),
                    ),

                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2-20,
                  child: Card(
                    color: Colors.grey.shade100,
                    child: Expanded(
                      child:  ListView.builder(
                        padding:  EdgeInsets.zero,
                          shrinkWrap: true,itemCount:length.toInt(),itemBuilder: (context, index){
                        return getRoleList(context,widget.usersResponse.relationships!.roles![index]);
                      }),
                      )
                    ),
                ),
                //SizedBox(width: MediaQuery.of(context).size.width*0.1,),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget getOrganizationList(BuildContext context, Organizations organizations) {
    //return Text("index $index");
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
         // mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      2, 2, 2, 2),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    8, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                            organizations.attributes!.name!,
                          style: const TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: const Color(0xFF15212B),
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget getRoleList(BuildContext context, Role role) {
    //return Text("index $index");
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(3, 5, 3, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      2, 2, 2, 2),
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    8, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "${role.attributes!.title}",
                          //  organization.attributes!.name!,
                          style: const TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: const Color(0xFF15212B),
                            fontSize: 18,
                            fontWeight:
                            FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}