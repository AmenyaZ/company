import 'dart:convert';

/// role_id : "5"
/// user_id : "7"

RoleUserRequest roleUserRequestFromJson(String str) => RoleUserRequest.fromJson(json.decode(str));
String roleUserRequestToJson(RoleUserRequest data) => json.encode(data.toJson());
class RoleUserRequest {
  RoleUserRequest({
      String? roleId, 
      String? userId,}){
    _roleId = roleId;
    _userId = userId;
}

  RoleUserRequest.fromJson(dynamic json) {
    _roleId = json['role_id'];
    _userId = json['user_id'];
  }
  String? _roleId;
  String? _userId;

  String? get roleId => _roleId;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role_id'] = _roleId;
    map['user_id'] = _userId;
    return map;
  }

}