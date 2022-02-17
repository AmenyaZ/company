
import 'dart:convert';

import 'package:company/api/Response/Login/User.dart';

LogInResponse logInResponseFromJson(String str) => LogInResponse.fromJson(json.decode(str));
String logInResponseToJson(LogInResponse data) => json.encode(data.toJson());
class LogInResponse {
  LogInResponse({
      User? user, 
      String? accessToken, 
      String? message,}){
    _user = user;
    _accessToken = accessToken;
    _message = message;
}

  LogInResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _message = json['message'];
  }
  User? _user;
  String? _accessToken;
  String? _message;

  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['message'] = _message;
    return map;
  }

}