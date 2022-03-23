import 'Role.dart';
import 'dart:convert';

ListRolesResponse listRolesResponseFromJson(String str) => ListRolesResponse.fromJson(json.decode(str));
String listRolesResponseToJson(ListRolesResponse data) => json.encode(data.toJson());
class ListRolesResponse {
  ListRolesResponse({
      List<Role>? role, 
      String? message,}){
    _role = role;
    _message = message;
}

  ListRolesResponse.fromJson(dynamic json) {
    if (json['role'] != null) {
      _role = [];
      json['role'].forEach((v) {
        _role?.add(Role.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<Role>? _role;
  String? _message;

  List<Role>? get role => _role;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_role != null) {
      map['role'] = _role?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}