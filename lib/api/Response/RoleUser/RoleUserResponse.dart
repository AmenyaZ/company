import 'dart:convert';

/// message : "Role Succesfully Assigned to User"

RoleUserResponse roleUserResponseFromJson(String str) => RoleUserResponse.fromJson(json.decode(str));
String roleUserResponseToJson(RoleUserResponse data) => json.encode(data.toJson());
class RoleUserResponse {
  RoleUserResponse({
      String? message,}){
    _message = message;
}

  RoleUserResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}