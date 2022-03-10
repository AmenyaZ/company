import 'dart:convert';
UserAtributes userAtributesFromJson(String str) => UserAtributes.fromJson(json.decode(str));
String userAtributesToJson(UserAtributes data) => json.encode(data.toJson());
class UserAtributes {
  UserAtributes({
      this.name, 
      this.email,});

  UserAtributes.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }

}