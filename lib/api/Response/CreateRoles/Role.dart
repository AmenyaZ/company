import 'dart:convert';

/// title : "cook"
/// slug : "cook"
/// description : "Prepares meals"
/// updated_at : "2022-03-23T08:54:25.000000Z"
/// created_at : "2022-03-23T08:54:25.000000Z"
/// id : 9

Role roleFromJson(String str) => Role.fromJson(json.decode(str));
String roleToJson(Role data) => json.encode(data.toJson());
class Role {
  Role({
      String? title, 
      String? slug, 
      String? description, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _title = title;
    _slug = slug;
    _description = description;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Role.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _title;
  String? _slug;
  String? _description;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get title => _title;
  String? get slug => _slug;
  String? get description => _description;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}