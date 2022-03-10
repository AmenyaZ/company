import 'Relationships.dart';
import 'dart:convert';
import 'UserAtributes.dart';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));
String usersToJson(Users data) => json.encode(data.toJson());
class Users {
  Users({
      String? type, 
      int? id,
    UserAtributes? attributes,
      Relationships? relationships,}){
    _type = type;
    _id = id;
    _attributes = attributes;
    _relationships = relationships;
}

  Users.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _attributes = json['attributes'] != null ? UserAtributes.fromJson(json['attributes']) : null;
    _relationships = json['relationships'] != null ? Relationships.fromJson(json['relationships']) : null;
  }
  String? _type;
  int? _id;
  UserAtributes? _attributes;
  Relationships? _relationships;

  String? get type => _type;
  int? get id => _id;
  UserAtributes ? get attributes => _attributes;
  Relationships? get relationships => _relationships;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    if (_relationships != null) {
      map['relationships'] = _relationships?.toJson();
    }
    return map;
  }

}