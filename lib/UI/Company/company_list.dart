
import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../api/Response/ListOrganizationResponse.dart';


class CompanyListWidget extends StatefulWidget {
  const CompanyListWidget({Key? key}) : super(key: key);

  @override
  _CompanyListWidgetState createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List Company = [];
  Future<ListOrganizationResponse>? organizationList;
  var dio = Dio();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    fetchOrganization();
    setState(() {
      SharedPreferenceHelper().getUserInformation().then((value){
        var service = NetworkService();
        print(organizationList);
        print(value.accessToken);
        organizationList = service.OrganizationList("Bearer ${value.accessToken}");
      });
    });
  }
  fetchOrganization(){
    print ("loading.....");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body:
      Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              getSearch(context),
              Expanded(
                  child: FutureBuilder<ListOrganizationResponse>(
                    future: organizationList,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        if(snapshot.data!.organizations!.isEmpty){
                          return Center(
                            child: Text("No Organization"),
                          );
                        } else {
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return  getOrganizationList(context);
                                //return Text("index $index");
                              }
                          );
                        }
                      }
                      return const Center(

                      );
                    }

                  )
              )
            ]

    )
        ],
      ),
    );
  }

  Widget getSearch(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 108,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFEEEEEE),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            4, 0, 4, 0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Color(0xFF95A1AC),
                          size: 24,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4, 0, 0, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search events here...',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.95, 0),
                          child: Icon(
                            Icons.tune_rounded,
                            color: Color(0xFF95A1AC),
                            size: 24,
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
    );
  }

  Widget getOrganizationList(BuildContext context) {

      //return Text("index $index");
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          8, 1, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Company Name',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF15212B),
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '123 Address St, City, ST',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '1.7mi',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF4B39EF),
                                  fontSize: 14,
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
                      Expanded(
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
          ],
        ),
      );

  }
}