
import 'dart:convert';

import 'package:company/api/Response/Registration/User.dart';

RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));
String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());
class RegistrationResponse {
  RegistrationResponse({
      User? user, 
      String? accessToken,}){
    _user = user;
    _accessToken = accessToken;
}

  RegistrationResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
  }
  User? _user;
  String? _accessToken;

  User? get user => _user;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    return map;
  }

}