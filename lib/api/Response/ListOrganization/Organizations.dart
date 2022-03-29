import 'Attributes.dart';
import 'dart:convert';

/// type : "organization"
/// id : 1
/// attributes : {"name":"Sona Stores","location":"Nairobi","year":2021,"image":null}

Organizations organizationsFromJson(String str) => Organizations.fromJson(json.decode(str));
String organizationsToJson(Organizations data) => json.encode(data.toJson());
class Organizations {
  Organizations({
      String? type, 
      int? id, 
      Attributes? attributes,}){
    _type = type;
    _id = id;
    _attributes = attributes;
}

  Organizations.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  String? _type;
  int? _id;
  Attributes? _attributes;
Organizations copyWith({  String? type,
  int? id,
  Attributes? attributes,
}) => Organizations(  type: type ?? _type,
  id: id ?? _id,
  attributes: attributes ?? _attributes,
);
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