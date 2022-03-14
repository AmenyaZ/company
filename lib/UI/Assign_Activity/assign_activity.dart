import 'package:flutter/material.dart';

class AssignActivityWidget extends StatefulWidget {
  const AssignActivityWidget({Key? key}) : super(key: key);

  @override
  _AssignActivityWidgetState createState() => _AssignActivityWidgetState();
}

class _AssignActivityWidgetState extends State<AssignActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children:[
         Column(
             mainAxisSize: MainAxisSize.max,
           children: [
             userContainer(context),
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
                    '[User Name Here]',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 24,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'User.name@domainname.com',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFFEE8B60),
                      fontSize: 14,
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
}
