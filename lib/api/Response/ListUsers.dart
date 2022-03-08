import 'ListUsers/Users.dart';
import 'dart:convert';

ListUsers listUsersFromJson(String str) => ListUsers.fromJson(json.decode(str));
String listUsersToJson(ListUsers data) => json.encode(data.toJson());
class ListUsers {
  ListUsers({
      List<Users>? users, 
      String? message,}){
    _users = users;
    _message = message;
}

  ListUsers.fromJson(dynamic json) {
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<Users>? _users;
  String? _message;

  List<Users>? get users => _users;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}