import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateRoleWidget extends StatefulWidget {
  const CreateRoleWidget({Key? key}) : super(key: key);

  @override
  _CreateRoleWidgetState createState() => _CreateRoleWidgetState();
}

class _CreateRoleWidgetState extends State<CreateRoleWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(

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
        // controller: textController1,
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
        //controller: myBioController,
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
    return  Align(
      alignment: AlignmentDirectional(0, 0.05),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: DialogButton(
            width: 200,
            onPressed: () => Navigator.pop(context),
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
