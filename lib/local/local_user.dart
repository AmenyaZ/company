import 'package:shared_preferences/shared_preferences.dart';
class LocalUser  {

  LocalUser(
      {String? userName,
        String? email,
        String? avatarUri,
        String? password,
        String? accessToken,
        String? id
      }
      ) {
    _userName = userName;
    _email = email;
    _avatarUri = avatarUri;
    _password = password;
    _accessToken = accessToken;
    _id = id;
  }

  LocalUser.fromJson(dynamic json) {
    _userName = json['username'];
    _email = json['email'];
    _avatarUri = json['avatar_uri'];
    _password = json['password'];
    _accessToken = json['access_token'];
    _id = json["id"];
  }

  String? _userName;
  String? _email;
  String? _avatarUri;
  String? _password;
  String? _accessToken;
  String? _id;

  String? get userName => _userName;

  String? get avatarUri => _avatarUri;

  String? get email => _email;

  String? get password => _password;

  String? get accessToken => _accessToken;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _userName;
    map['email'] = _email;
    map['avatar_uri'] = _avatarUri;
    map['password'] = _password;
    map['access_token'] = _accessToken;
    map["id"] = _id;
    return map;
  }
}

