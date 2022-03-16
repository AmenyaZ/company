
import 'package:company/UI/roles/create_role.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListRolesResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/painting.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RolesList extends StatefulWidget {
  const RolesList({Key? key}) : super(key: key);
  @override
  _RolesListState createState() => _RolesListState();
}

class _RolesListState extends State<RolesList> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var service = NetworkService();
  final List<GlobalKey<ExpansionTileCardState>> cardKeyList = [];
  int selected = 0;

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  Future<ListRolesResponse>? roleList;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    SharedPreferenceHelper().getUserInformation().then((value){
      setState(() {
        roleList = service.RoleList(value.accessToken!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                getSearch(context),
                //SizedBox(height: h*0.3,),
                Expanded(
                    child: FutureBuilder<ListRolesResponse>(

                        future: roleList,
                        builder: (context, snapshot){
                          print(snapshot.data);
                          if(snapshot.hasData){
                            if(snapshot.data!.role!.isEmpty){
                              return Center(
                                child: Text("No Organization"),
                              );
                            } else if(snapshot.data!.role!.isNotEmpty){
                              return ListView.builder(
                                  key: Key('builder ${selected.toString()}'),
                                  //attention
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.role!.length,
                                  itemBuilder: (context, index) {

                                    cardKeyList.add(GlobalKey(debugLabel: "index :$index"));
                                    return  myRole(context,snapshot.data!.role![index]);
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

          ),
          //SizedBox(height: 3,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const CreateRoleWidget())
          );
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add_outlined),
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
                              labelText: 'Search Roles here...',
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
  Widget getRole (BuildContext context){

    return SizedBox(

      child: ExpansionCard(
        //backgroundColor: Colors.blueAccent,
        background: Image.asset(
            'assets/images/card3.jpg',
            fit: BoxFit.fill),
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Header",
                style: TextStyle(
                  fontFamily: 'BalooBhai',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                "Sub",
                style: TextStyle(
                    fontFamily: 'BalooBhai', fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(horizontal: 7),
            child: Text("Content goes over here !",
                style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 20,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget myRole(BuildContext context, Role role){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    int? index = role.id;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x39000000),
            offset: Offset(0, -1.5),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),

      child: ExpansionTileCard(
        initiallyExpanded: index == selected,
        //  key: cardKeyList[index],        //leading: CircleAvatar(child: Text('A')),
        title: Text(role.attributes!.title!),
        //subtitle: Text('I expand!'),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                role.attributes!.description!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),

          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonHeight: 52.0,
            buttonMinWidth: 10.0,
            children: <Widget>[
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  _openEditPopup(context);
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.edit),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text('Edit'),
                  ],
                ),
              ),

              SizedBox(width: 70,),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  // cardB.currentState?.toggleExpansion();
                  _openDeletePopup(context);
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.delete,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      'delete',
                      style: TextStyle(
                          color: Colors.red
                      ),),
                  ],
                ),
              ),
            ],
          ),

        ],
        onExpansionChanged: ((newState) {
          if (newState)
            setState(() {
              Duration(seconds: 20000);
              selected = index!;
            });
          else
            setState(() {
              selected = -1;
            });
        }),
      ),
    );
  }

  _openEditPopup(context) {
    Alert(
        context: context,
        image: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fitWidth,
          width: 100,
          height: 100,
        ),
        title: "Edit Role",
        content:  Container(
          width: 800,
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children:<Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
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
                    hintText: 'Enter Title...',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
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
                    hintText: 'Add Description...',
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
                  maxLines: 6,
                ),
              ),
            ],
          ),
        ),
        /*
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),

         */
        buttons: [
          DialogButton(
            width: 150,
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Save Info",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
        ]).show();
  }
  _openDeletePopup(context){
    Alert(
      context: context,
      type: AlertType.warning,
      title: 'DELETE',
      desc: "Confirm To Delete This Role",
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blueAccent,
        ),
        DialogButton(
          color: Colors.red,
          child: Text(
            "Delete",
            style: TextStyle(color: Colors.white, fontSize: 18),

          ),
          onPressed: (){
            setState(() {

            });
          }
          //=> Navigator.pop(context),
        )
      ],
    ).show();
  }

}
