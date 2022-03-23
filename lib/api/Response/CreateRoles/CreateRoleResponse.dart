import 'Role.dart';
import 'dart:convert';

/// role : {"title":"cook","slug":"cook","description":"Prepares meals","updated_at":"2022-03-23T08:54:25.000000Z","created_at":"2022-03-23T08:54:25.000000Z","id":9}
/// message : "Role Created"

CreateRoleResponse createRoleResponseFromJson(String str) => CreateRoleResponse.fromJson(json.decode(str));
String createRoleResponseToJson(CreateRoleResponse data) => json.encode(data.toJson());
class CreateRoleResponse {
  CreateRoleResponse({
      Role? role, 
      String? message,}){
    _role = role;
    _message = message;
}

  CreateRoleResponse.fromJson(dynamic json) {
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
    _message = json['message'];
  }
  Role? _role;
  String? _message;

  Role? get role => _role;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_role != null) {
      map['role'] = _role?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}