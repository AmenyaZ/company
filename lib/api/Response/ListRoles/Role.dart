import 'Attributes.dart';
import 'dart:convert';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));
String roleToJson(Role data) => json.encode(data.toJson());
class Role {
  Role({
      String? type, 
      int? id, 
      Attributes? attributes,}){
    _type = type;
    _id = id;
    _attributes = attributes;
}

  Role.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  String? _type;
  int? _id;
  Attributes? _attributes;

  String? get type => _type;
  int? get id => _id;
  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }

}