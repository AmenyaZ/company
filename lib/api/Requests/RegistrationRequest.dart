import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) => RegistrationRequest.fromJson(json.decode(str));
String registrationRequestToJson(RegistrationRequest data) => json.encode(data.toJson());
class RegistrationRequest {
  RegistrationRequest({
      String? name, 
      String? email, 
      String? password, 
      String? passwordConfirmation,}){
    _name = name;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
}

  RegistrationRequest.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _passwordConfirmation;

  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

}