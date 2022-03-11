import 'package:company/UI/User/profile_detail.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/api/Response/ListUsersResponse.dart';
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
  Future<ListUsersResponse>? userList;

  @override
  void initState()  {
    super.initState();
    // EasyLoading.show();
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        email = value.email!;
        username = value.userName!;
        userList = service.UserList(value.accessToken!);
        // accessToken = value.accessToken!;
        // print("Print token: ${value.accessToken}");
        // print("Email: ${value.email}");
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            profileHeader(context),
            const SizedBox(height: 10.0),
            usersContent(context),

          ],
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
    return Container(

      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15) ,
          )
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              color: Colors.grey.shade100,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2-20,
                    child: Column(
                      children: [
                        Text("Text"),
                        Card(child: getOrganizationList(context)),
                        Card(child: getOrganizationList(context)),
                      ],
                    ),
                  ),
                  //SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                  Container(
                    width: MediaQuery.of(context).size.width/2-20,
                    child: Column(
                      children: [
                        Text("Text"),
                        Card(child: getRoleList(context)),
                        Card(child: getRoleList(context)),
                      ],
                    ),
                  ),
                ],
              ),
              /*
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          /*
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Location"),
                            subtitle: Text("Kathmandu"),
                          ),

                           */
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text(email),
                          ),
                          /*
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99--99876-56"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text(
                                "This is a about me link and you can khow about me in this section."),
                          ),
                          */
                        ],
                      ),
                    ],
                  )
                ],
              ),
              */
            ),
          )
        ],
      ),
    );
  }
  Widget getOrganizationList(BuildContext context) {
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
            Expanded(
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
                        Text("jjj",
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(
                        0, 0, 8, 0),
                    child: Icon(
                      Icons.chevron_right_outlined,
                      color: Color(0xFF95A1AC),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  Widget getRoleList(BuildContext context) {
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
            Expanded(
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
                          "${widget.usersResponse.relationships!.roles!.first}",
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(
                        0, 0, 8, 0),
                    child: Icon(
                      Icons.chevron_right_outlined,
                      color: Color(0xFF95A1AC),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }

}