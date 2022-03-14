import 'dart:convert';

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      this.name, 
      this.location, 
      this.year, 
      this.logo,});

  Attributes.fromJson(dynamic json) {
    name = json['name'];
    location = json['location'];
    year = json['year'];
    logo = json['logo'];
  }
  String? name;
  String? location;
  int? year;
  String? logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['location'] = location;
    map['year'] = year;
    map['logo'] = logo;
    return map;
  }

}