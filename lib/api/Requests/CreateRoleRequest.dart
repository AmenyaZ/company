import 'dart:convert';

/// title : "cook"
/// description : " Prepares meals"

CreateRoleRequest createRoleRequestFromJson(String str) => CreateRoleRequest.fromJson(json.decode(str));
String createRoleRequestToJson(CreateRoleRequest data) => json.encode(data.toJson());
class CreateRoleRequest {
  CreateRoleRequest({
      String? title, 
      String? description,}){
    _title = title;
    _description = description;
}

  CreateRoleRequest.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }
  String? _title;
  String? _description;

  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}