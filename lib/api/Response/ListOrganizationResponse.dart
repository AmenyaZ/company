import 'package:company/api/Response/ListOrganization/Organizations.dart';

import 'dart:convert';

ListOrganizationResponse listOrganizationResponseFromJson(String str) => ListOrganizationResponse.fromJson(json.decode(str));
String listOrganizationResponseToJson(ListOrganizationResponse data) => json.encode(data.toJson());
class ListOrganizationResponse {
  ListOrganizationResponse({
      List<Organizations>? organizations, 
      String? message,}){
    _organizations = organizations;
    _message = message;
}

  ListOrganizationResponse.fromJson(dynamic json) {
    if (json['organizations'] != null) {
      _organizations = [];
      json['organizations'].forEach((v) {
        _organizations?.add(Organizations.fromJson(v));
      });
    }
    _message = json['message'];
  }
  List<Organizations>? _organizations;
  String? _message;

  List<Organizations>? get organizations => _organizations;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_organizations != null) {
      map['organizations'] = _organizations?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}