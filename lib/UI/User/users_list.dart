
import 'package:company/api/Response/ListUsersResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late TextEditingController textController;
  var service = NetworkService();
  Future<ListUsersResponse>? organizationList;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        organizationList = service.UserList(value.accessToken!);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              getSearch(context),
              getUserList(context)

            ],
          ),
        ],

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
  Widget getUserList(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.91,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    8, 0, 0, 0),
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F4F8),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                )
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jane Doe',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF1E2429),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    12, 0, 12, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0, 4, 0, 0),
                      child: Text(
                        'Hello World',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

               */
            ],
          ),
        ),
      ),
    );
  }
}
