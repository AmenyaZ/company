import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignActivityWidget extends StatefulWidget {
  const AssignActivityWidget({Key? key}) : super(key: key);

  @override
  _AssignActivityWidgetState createState() => _AssignActivityWidgetState();
}
class _AssignActivityWidgetState extends State<AssignActivityWidget> {
  var dropdownValue;

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
              activityContent(context)
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
        width:  400,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 6),
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
                    color:Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Users",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )),
                _hintDown(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color:Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          "Organization",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    )),
                _hintDown(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color:Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Roles",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )),
                _hintDown(),
              ],
            ),
          ),
        ],
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
