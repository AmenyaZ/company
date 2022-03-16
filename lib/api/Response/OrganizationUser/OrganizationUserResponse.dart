import 'dart:convert';

/// message : "User Succesfully added to Organization"

OrganizationUserResponse organizationUserResponseFromJson(String str) => OrganizationUserResponse.fromJson(json.decode(str));
String organizationUserResponseToJson(OrganizationUserResponse data) => json.encode(data.toJson());
class OrganizationUserResponse {
  OrganizationUserResponse({
      String? message,}){
    _message = message;
}

  OrganizationUserResponse.fromJson(dynamic json) {
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