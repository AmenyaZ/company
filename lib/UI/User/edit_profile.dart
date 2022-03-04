import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String uploadedFileUrl = '';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
      body: Container(
          padding: EdgeInsetsDirectional.fromSTEB(1, 50, 1, 1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                imageIcon(context),
                changePhoto(context),
                userDetailedName(context),
                emailAdress(context),
                updatePassword(context),
                /*
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final selectedMedia = await selectMedia(
                        mediaSource: MediaSource.photoGallery,
                      );
                      if (selectedMedia != null &&
                          validateFileFormat(selectedMedia.storagePath, context)) {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        final downloadUrl = await uploadData(
                            selectedMedia.storagePath, selectedMedia.bytes);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(() => uploadedFileUrl = downloadUrl);
                          showUploadMessage(
                            context,
                            'Success!',
                          );
                        } else {
                          showUploadMessage(
                            context,
                            'Failed to upload media',
                          );
                          return;
                        }
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      'zoxan2gi' /* Change Photo */,
                    ),
                    options: FFButtonOptions(
                      width: 140,
                      height: 40,
                      color: FlutterFlowTheme.of(context).darkBackground,
                      textStyle: FlutterFlowTheme.of(context).bodyText2,
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),

 */
                /*
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourNameController ??= TextEditingController(
                      text: editProfileUsersRecord.displayName,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '3p9y21e2' /* Your Name */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'dw9gmjdc' /* Please enter a valid number... */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).darkBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourEmailController ??= TextEditingController(
                      text: editProfileUsersRecord.email,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'z4fstn5l' /* Email Address */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'jozgvwyg' /* Your email */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).darkBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourAgeController ??= TextEditingController(
                      text: editProfileUsersRecord.age.toString(),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '8h1cjk5a' /* Your Age */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        '5v21r6gb' /* i.e. 34 */,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).darkBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).textColor,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourTitleController ??= TextEditingController(
                      text: editProfileUsersRecord.userTitle,
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'zvymbfia' /* Your Title */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).grayLight,
                      ),
                      hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).darkBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).textColor,
                    ),
                  ),
                ),

                 */
                /*
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final usersUpdateData = createUsersRecordData(
                        displayName: yourNameController?.text ?? '',
                        email: yourEmailController?.text ?? '',
                        age: int.parse(yourAgeController?.text ?? ''),
                        userTitle: valueOrDefault<String>(
                          yourTitleController?.text ?? '',
                          'Badass Geek',
                        ),
                        photoUrl: uploadedFileUrl,
                      );
                      await editProfileUsersRecord.reference.update(usersUpdateData);
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'i6edcl52' /* Save Changes */,
                    ),
                    options: FFButtonOptions(
                      width: 230,
                      height: 56,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ),
                ),

                 */
                saveButton(context)
              ],
            ),
          ),
        ),
    );

  }
  Widget imageIcon(BuildContext context){
    return  Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 80,
        height: 80,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Image.network(
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
        ),
      ),
    );
  }
  Widget changePhoto(BuildContext context){
    return  Align(
      alignment: AlignmentDirectional(0, 0.05),
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: DialogButton(
            width: 120,
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Change Photo",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
      ),
    );

  }
  Widget userDetailedName(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Container(

        child: TextFormField(
          // controller: textController1,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Full Name',
            labelStyle: TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hintText: 'Enter Full Name...',
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
  Widget emailAdress(BuildContext context){
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  const SnackBar(
                      content: Text("Please enter your Email"));
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            //  controller: emailController,

              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your email here...',
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
                contentPadding:
                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
              ),
              style: TextStyle(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF2B343A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
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
              "Update Details",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            radius: BorderRadius.all(Radius.circular(16)),
          )
      ),
    );

  }
  Widget updatePassword(BuildContext context){
    var passwordVisibility = false;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  const SnackBar(
                      content:
                      Text("Please enter your Password"));
                } else {
                  return null;
                }
              },
            //  controller: passwordController,
            //  obscureText: !passwordVisibility,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF95A1AC),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                hintText: 'Enter your password here...',
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
                contentPadding:
                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                suffixIcon: InkWell(
                  onTap: () => setState(
                        () =>
                    passwordVisibility = !passwordVisibility,
                  ),
                  child: Icon(
                    passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF95A1AC),
                    size: 22,
                  ),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF2B343A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }



}
