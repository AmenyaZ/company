import 'dart:convert';

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? title, 
      String? slug, 
      String? description,}){
    _title = title;
    _slug = slug;
    _description = description;
}

  Attributes.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
  }
  String? _title;
  String? _slug;
  String? _description;

  String? get title => _title;
  String? get slug => _slug;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    return map;
  }

}