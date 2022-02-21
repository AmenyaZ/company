import 'dart:async';


import 'package:company/local/local_user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveUserInformation(LocalUser localUser) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("username", localUser.userName!);
    prefs.setString("email", localUser.email!);
    prefs.setString("avatarUri", localUser.avatarUri!);
    prefs.setString("password", localUser.password!);
    prefs.setString("accessToken", localUser.accessToken!);
    prefs.setString("id", localUser.id!);
  }

  Future<LocalUser> getUserInformation() async {
    final SharedPreferences prefs = await _prefs;
    String userName = prefs.getString('username') ?? "";
    String email = prefs.getString('email') ?? "";
    String avatarUri = prefs.getString('avatarUri') ?? "";
    String password = prefs.getString('password') ?? "";
    String accessToken = prefs.getString('accessToken') ?? "";
    String id = prefs.getString("id") ?? "";

    return LocalUser(
      userName: userName,
      email: email,
      avatarUri: avatarUri,
      password: password,
      accessToken: accessToken,
      id: id,
    );
  }

  Future<void> deleteLocalUser() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove("username");
    prefs.remove("email");
    prefs.remove("avatarUri");
    prefs.remove("password");
    prefs.remove("accessToken");
    prefs.remove("id");
  }
}
