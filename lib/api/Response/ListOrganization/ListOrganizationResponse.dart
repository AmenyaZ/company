import 'Organizations.dart';
import 'dart:convert';

/// organizations : [{"type":"organization","id":1,"attributes":{"name":"Sona Stores","location":"Nairobi","year":2021,"image":null}},{"type":"organization","id":2,"attributes":{"name":"Kime Stores","location":"Nairobi","year":2021,"image":null}},{"type":"organization","id":3,"attributes":{"name":"Zero Stores","location":"Kikuyu","year":2000,"image":null}},{"type":"organization","id":4,"attributes":{"name":"Zero Stores","location":"Kikuyu","year":2000,"image":null}},{"type":"organization","id":5,"attributes":{"name":"KImani Stores","location":"Kikuyu","year":2022,"image":null}},{"type":"organization","id":6,"attributes":{"name":"New Stores","location":"Migori","year":2022,"image":null}},{"type":"organization","id":7,"attributes":{"name":"Zamzam Stores","location":"kitui","year":2016,"image":null}},{"type":"organization","id":8,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":9,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":10,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":11,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":12,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":13,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":14,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":15,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":16,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":17,"attributes":{"name":"karau","location":"karen","year":1988,"image":null}},{"type":"organization","id":18,"attributes":{"name":"Ken Stores","location":"Kitui","year":2012,"image":null}},{"type":"organization","id":19,"attributes":{"name":"Ken Stores","location":"Kitui","year":2012,"image":null}},{"type":"organization","id":20,"attributes":{"name":"Apolo Stores","location":"Kitui","year":2013,"image":null}},{"type":"organization","id":21,"attributes":{"name":"hhhh Storesee","location":"Kikuyu","year":2000,"image":"/home/amenya/Laravel-Projects/companyAPI/storage/app/hhhhStoresee.png"}},{"type":"organization","id":22,"attributes":{"name":"Simanzi Stores","location":"Killo","year":2003,"image":"/home/amenya/Laravel-Projects/companyAPI/storage/app/SimanziStores.jpeg"}}]
/// message : "Organizations Retrieved successfully"

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
ListOrganizationResponse copyWith({  List<Organizations>? organizations,
  String? message,
}) => ListOrganizationResponse(  organizations: organizations ?? _organizations,
  message: message ?? _message,
);
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