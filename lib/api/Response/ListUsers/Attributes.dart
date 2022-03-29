import 'dart:convert';

/// name : "Admin"
/// email : "admin@gmail.com"
/// image : null

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? name, 
      String? email, 
      dynamic image,}){
    _name = name;
    _email = email;
    _image = image;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
  }
  String? _name;
  String? _email;
  dynamic _image;
Attributes copyWith({  String? name,
  String? email,
  dynamic image,
}) => Attributes(  name: name ?? _name,
  email: email ?? _email,
  image: image ?? _image,
);
  String? get name => _name;
  String? get email => _email;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    return map;
  }

}