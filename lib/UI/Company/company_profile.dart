import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CompanyProfileWidget extends StatefulWidget {
  const CompanyProfileWidget({Key? key, required this.organizationResponse}) : super(key: key);
  final Organizations organizationResponse;
  @override
  _CompanyProfileWidgetState createState() => _CompanyProfileWidgetState();

}
class _CompanyProfileWidgetState extends State<CompanyProfileWidget> {

  @override
  Widget build(BuildContext context) {
    const Divider(
      height: 5,
      thickness: 3,
      indent: 16,
      endIndent: 16,
      // color: Colors.red,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: ListView(
        children: <Widget>[
          companyLogo(context),
          companyName(context),
          companyInfo(context),
          const Divider(),
          companyLocation(context),
          companyYear(context),

        ],
      ),
    );
  }
  Widget companyLogo (BuildContext context){
    return Padding(

      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2, 80, 2, 5),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                // color: Color(0xFFDBE2E7),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: Container(
                  width: 90,
                  height: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: (widget.organizationResponse.attributes!.image == null)
                      ? Image.asset('assets/images/logo.png',fit: BoxFit.fitWidth,) : Image.network("${Constants.BASEURL}/storage/${widget.organizationResponse.attributes!.image}"),
                  //
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
  Widget companyName (BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
      child: Center(
        child: Container(
          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          // color:  Colors.white,
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "${widget.organizationResponse.attributes!.name}",
            style: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

  }
  Widget companyInfo (BuildContext context){
    return // Generated code for this socialLinks Widget...
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    print('IconButton pressed ...');
                  },
                  child: Container(
                    height: 60,
                    width: 70,
                    child: Card(

                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blueAccent,                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    print('IconButton pressed ...');
                  },
                  child: Container(
                    height:60,
                    width: 70,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    print('IconButton pressed ...');
                  },
                  child: Container(
                    height: 60,
                    width: 70,
                    child: Card(

                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Call',
                    style: TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      );

  }
  Widget companyLocation(BuildContext context){
    return Card(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.location_on_outlined,)
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [/*
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fleet Assistant',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily:  'Lexend Deca',
                          color: Color(0xB3FFFFFF),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '4:30pm',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                         fontFamily:  'Lexend Deca',
                          color: Color(0xB3FFFFFF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  */
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${widget.organizationResponse.attributes!.location}',
                          style:TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
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
    );
  }
  Widget companyYear(BuildContext context){
    return Card(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.calendar_today,)
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [/*
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fleet Assistant',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily:  'Lexend Deca',
                          color: Color(0xB3FFFFFF),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '4:30pm',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                         fontFamily:  'Lexend Deca',
                          color: Color(0xB3FFFFFF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  */
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${widget.organizationResponse.attributes!.year}',
                          style:TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
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
    );
  }

}

