import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:company/api/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';

class CreateCompanyWidget extends StatefulWidget {
  const CreateCompanyWidget({Key? key}) : super(key: key);

  @override
  _CreateCompanyWidgetState createState() => _CreateCompanyWidgetState();
}

class _CreateCompanyWidgetState extends State<CreateCompanyWidget> {

  DateTime? _chosenDateTime;
  var legalNameController = TextEditingController();
  var locationController = TextEditingController();
  var yearController;
  bool isLoading = false;
  var service = NetworkService();
  File? imageFile;


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
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 14),
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
            pickYear(context),
            saveButton(context),
          ],
        ),
      ),
    );
  }
  Widget profileImage (BuildContext context){
    return  Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: imageFile == null
                ?
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFFDBE2E7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: (){
                            _getFromGallery();
                          },
                          child: Image.asset(
                            'assets/images/logo.png',
                            //fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  )

                   */
                ],
              ),
            )
                :
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Color(0xFFDBE2E7),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget logoIcon(BuildContext context){
    return // Generated code for this Row Widget...
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: Color(0xFFDBE2E7),
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
                child: Image.network(
                  'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=630&q=80',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          /*
          MaterialButton(
            color: Colors.blueAccent,
           // shape:
            focusColor: Colors.grey.shade100,
            elevation: 0,
            child: Text("Add Logo"),
            onPressed: () {
            },
          )

           */
        ],
      );

    /*
      Row(
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

       */
  }
  Widget companyName(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
      child: Container(

        child: TextFormField(
          controller: legalNameController,
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
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Container(
        child: TextFormField(
          controller: locationController,
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
  Widget pickYear(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFDBE2E7),
                style: BorderStyle.solid,
                width: 2,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFDBE2E7),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CupertinoButton(
                    //color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: const Text('Select Date'),
                    onPressed: () => _showDatePicker(context),
                  ),
                ),
                SizedBox(width: 10),
                Text(_chosenDateTime != null
                    ? _chosenDateTime.toString()
                    : 'No date time picked!'),
              ],
            ),
          ),
        ),
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
  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                    }
                    ),
              ),

              // Close the modal
              CupertinoButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));
  }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      final bytes = File(pickedFile.path).readAsBytesSync();

      String img64 = base64Encode(bytes);

      print("suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................suee...........................................................................................................................................................................................................................................................${img64}");


    }
  }


}
