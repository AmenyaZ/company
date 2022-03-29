import 'dart:convert';

/// name : "Sona Stores"
/// location : "Nairobi"
/// year : 2021
/// image : null

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? name, 
      String? location, 
      int? year, 
      dynamic image,}){
    _name = name;
    _location = location;
    _year = year;
    _image = image;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _location = json['location'];
    _year = json['year'];
    _image = json['image'];
  }
  String? _name;
  String? _location;
  int? _year;
  dynamic _image;
Attributes copyWith({  String? name,
  String? location,
  int? year,
  dynamic image,
}) => Attributes(  name: name ?? _name,
  location: location ?? _location,
  year: year ?? _year,
  image: image ?? _image,
);
  String? get name => _name;
  String? get location => _location;
  int? get year => _year;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['location'] = _location;
    map['year'] = _year;
    map['image'] = _image;
    return map;
  }

}