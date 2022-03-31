
import 'package:company/UI/Authentication/register_employee.dart';
import 'package:company/UI/Company/create_company.dart';
import 'package:company/UI/User/create_user.dart';
import 'package:company/UI/User/user_profile.dart';
import 'package:company/api/Response/ListUsers/Users.dart';
import 'package:company/api/Response/ListUsers/ListUsersResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:company/util/constants.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({Key? key}) : super(key: key);

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  var searchUserController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var service = NetworkService();
  Future<ListUsersResponse>? userList;

  bool isLoading = false;

  
  @override
  void initState() {
    super.initState();
    getNewUser();
  }

  void getNewUser() async {
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        userList = service.UserList(value.accessToken!);
      });
    });
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getNewUser();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: const Color(0xFFF1F4F8),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              getSearch(context),
              Expanded(
                child: FutureBuilder<ListUsersResponse>(
                    future: userList,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        if (snapshot.data!.users!.isEmpty){
                          return Center(child: Text("No Users "));
                        }
                        else if(snapshot.data!.users!.isNotEmpty){
                          return ListView.builder(
                            itemCount: snapshot.data!.users!.length,
                            itemBuilder: (context, index){
                              //print("list${snapshot.data!.users![index].attributes!.name}");
                              return InkWell(
                                  onTap: (){
                                   // print(snapshot.data!.users![index].toJson());
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> UserProfileWidget(
                                            usersResponse: snapshot.data!.users![index]
                                        ))
                                    );
                                  },
                                  child: getUserList(context, snapshot.data!.users![index]),

                              );
                            },
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
                ),
              )

            ],
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateUserWidget())
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
        color: const Color(0xFFF1F4F8),
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
                            controller: searchUserController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'Search User here...',
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
  Widget getUserList(BuildContext context, Users users){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: Card(
        color: const Color(0xFFF1F4F8),
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    8, 2, 2, 2),
                child: Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: (users.attributes!.image == null)
                    ? Image.asset('assets/images/profile.png',fit: BoxFit.fitWidth,) :  Image.network("${Constants.BASEURL}/storage/${users.attributes!.image}")
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
                      "${users.attributes?.name}",
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
          ],
        ),
      ),
    );
  }
}
