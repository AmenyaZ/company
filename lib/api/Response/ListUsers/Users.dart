import 'Relationships.dart';
import 'dart:convert';

import 'UserAtributes.dart';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));
String usersToJson(Users data) => json.encode(data.toJson());
class Users {
  Users({
      this.type, 
      this.id, 
      this.attributes, 
      this.relationships,});

  Users.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null ? UserAtributes.fromJson(json['attributes']) : null;
    relationships = json['relationships'] != null ? Relationships.fromJson(json['relationships']) : null;
  }
  String? type;
  int? id;
  UserAtributes? attributes;
  Relationships? relationships;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    if (attributes != null) {
      map['attributes'] = attributes?.toJson();
    }
    if (relationships != null) {
      map['relationships'] = relationships?.toJson();
    }
    return map;
  }

}