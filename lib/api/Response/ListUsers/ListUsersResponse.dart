import 'Users.dart';
import 'dart:convert';

ListUsersResponse listUsersResponseFromJson(String str) => ListUsersResponse.fromJson(json.decode(str));
String listUsersResponseToJson(ListUsersResponse data) => json.encode(data.toJson());
class ListUsersResponse {
  ListUsersResponse({
      List<Users>? users, 
      String? message,}){
    _users = users;
    _message = message;
}

  ListUsersResponse.fromJson(dynamic json) {
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