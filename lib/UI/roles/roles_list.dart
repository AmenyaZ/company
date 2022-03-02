
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListRolesResponse.dart';
import 'package:company/api/services/api_client.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/painting.dart';

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
      body:
      Stack(
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

        //key: cardKeyList[index],        //leading: CircleAvatar(child: Text('A')),
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
                  cardB.currentState?.expand();
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
              /*
              TextButton(
                style: flatButtonStyle,

                onPressed: () {
                  cardB.currentState?.collapse();
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.arrow_upward),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text('Close'),
                  ],
                ),
              ),

               */
              SizedBox(width: 70,),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  cardB.currentState?.toggleExpansion();
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
      ),
    );
  }

}
