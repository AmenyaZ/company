import 'package:company/UI/User/profile_detail.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';

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
      //backgroundColor: Colors.grey.shade100,
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
      padding: EdgeInsets.all(10),
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
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
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
            ),
          )
        ],
      ),
    );
  }
}