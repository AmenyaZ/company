import 'dart:convert';

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? name, 
      String? location, 
      int? year, 
      String? logo,}){
    _name = name;
    _location = location;
    _year = year;
    _logo = logo;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _location = json['location'];
    _year = json['year'];
    _logo = json['logo'];
  }
  String? _name;
  String? _location;
  int? _year;
  String? _logo;

  String? get name => _name;
  String? get location => _location;
  int? get year => _year;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['location'] = _location;
    map['year'] = _year;
    map['logo'] = _logo;
    return map;
  }

}