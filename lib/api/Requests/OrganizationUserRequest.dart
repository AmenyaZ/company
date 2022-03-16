import 'dart:convert';

/// organization_id : "4"
/// user_id : "4"

OrganizationUserRequest organizationUserRequestFromJson(String str) => OrganizationUserRequest.fromJson(json.decode(str));
String organizationUserRequestToJson(OrganizationUserRequest data) => json.encode(data.toJson());
class OrganizationUserRequest {
  OrganizationUserRequest({
      String? organizationId, 
      String? userId,}){
    _organizationId = organizationId;
    _userId = userId;
}

  OrganizationUserRequest.fromJson(dynamic json) {
    _organizationId = json['organization_id'];
    _userId = json['user_id'];
  }
  String? _organizationId;
  String? _userId;

  String? get organizationId => _organizationId;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['organization_id'] = _organizationId;
    map['user_id'] = _userId;
    return map;
  }

}