
//import 'dart:html';

import 'package:company/UI/Company/company_profile.dart';
import 'package:company/UI/Company/create_company.dart';
import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
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
  var service = NetworkService();
  Future<ListOrganizationResponse>? organizationList;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
      SharedPreferenceHelper().getUserInformation().then((value){
        setState(() {
          organizationList = service.OrganizationList(value.accessToken!);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              getSearch(context),
              Expanded(
                  child: FutureBuilder<ListOrganizationResponse>(
                    future: organizationList,
                    builder: (context, snapshot){
                      print(snapshot.data);
                      if(snapshot.hasData){
                        if(snapshot.data!.organizations!.isEmpty){
                          return const Center(
                            child: Text("No Organization"),
                          );
                        } else if(snapshot.data!.organizations!.isNotEmpty){
                          return ListView.builder(
                            itemCount: snapshot.data!.organizations!.length,
                              itemBuilder: (context, index) {
                                return  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>  CompanyProfileWidget(
                                          organizationResponse: snapshot.data!.organizations![index]
                                        )),
                                      );
                                    },
                                    child: getOrganizationList(context,snapshot.data!.organizations![index])
                                );
                                //return Text("index $index");
                              }
                          );
                        }
                      }
                      else if(snapshot.hasError){
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                  )
              )
            ]

    )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const CreateCompanyWidget())
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add_outlined),
      ),

    );
  }

  Widget getSearch(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 108,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4, 0, 0, 0),
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Search Organization here...',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: const Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
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

  Widget getOrganizationList(BuildContext context, Organizations organization) {
      //return Text("index $index");
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                organization.attributes!.name!,
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                organization.attributes!.location!,
                                style: const TextStyle(
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
                                organization.attributes!.year!.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.blueAccent,
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
          ],
        ),
      );

  }
}