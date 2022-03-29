import 'dart:convert';

import 'package:company/api/Response/ListOrganization/Organizations.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListRoles/Role.dart';
import 'package:company/api/Response/ListUsers/Users.dart';

import 'dart:convert';


/// roles : []
/// organizations : []

Relationships relationshipsFromJson(String str) => Relationships.fromJson(json.decode(str));
String relationshipsToJson(Relationships data) => json.encode(data.toJson());
class Relationships {
  Relationships({
      List<dynamic>? roles, 
      List<dynamic>? organizations,}){
    _roles = roles;
    _organizations = organizations;
}

  Relationships.fromJson(dynamic json) {
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Role.fromJson(v));
      });
    }
    if (json['organizations'] != null) {
      _organizations = [];
      json['organizations'].forEach((v) {
        _organizations?.add(Organizations.fromJson(v));
      });
    }
  }
  List<dynamic>? _roles;
  List<dynamic>? _organizations;
Relationships copyWith({  List<dynamic>? roles,
  List<dynamic>? organizations,
}) => Relationships(  roles: roles ?? _roles,
  organizations: organizations ?? _organizations,
);
  List<dynamic>? get roles => _roles;
  List<dynamic>? get organizations => _organizations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    if (_organizations != null) {
      map['organizations'] = _organizations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}