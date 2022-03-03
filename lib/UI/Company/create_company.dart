import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateCompanyWidget extends StatefulWidget {
  const CreateCompanyWidget({Key? key}) : super(key: key);

  @override
  _CreateCompanyWidgetState createState() => _CreateCompanyWidgetState();
}

class _CreateCompanyWidgetState extends State<CreateCompanyWidget> {
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
                  'Add Company',
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
          companyName(context),
          companyLocaton(context),
          saveButton(context),
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
  Widget companyName(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
      child: Container(

        child: TextFormField(
          // controller: textController1,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Legal Name',
            labelStyle: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hintText: 'Enter Company´s Legal Name...',
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
      ),
    );
  }
  Widget companyLocaton(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
      child: Container(

        child: TextFormField(
          // controller: textController1,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Location',
            labelStyle: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hintText: 'Enter Company´s Physical Location...',
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
              "Add Company",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
      ),
    );

  }
  Widget pickYear(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text('Select a Year'),
      // Changing default contentPadding to make the content looks better

      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        // Giving some size to the dialog so the gridview know its bounds

        height: size.height*0.3,
        width: size.width*0.03,
        //  Creating a grid view with 3 elements per line.
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            // Generating a list of 123 years starting from 2022
            // Change it depending on your needs.
            ...List.generate(
              123,
                  (index) => InkWell(
                onTap: () {
                  // The action you want to happen when you select the year below,

                  // Quitting the dialog through navigator.
                  Navigator.pop(context);
                },
                // This part is up to you, it's only ui elements
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Container(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        // Showing the year text, it starts from 2022 and ends in 1900 (you can modify this as you like)
                        (2022 - index).toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




}
