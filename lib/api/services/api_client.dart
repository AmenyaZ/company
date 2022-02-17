import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:company/api/Requests/LoginRequest.dart';
import 'package:company/api/Response/LogInResponse.dart';
import 'package:http/http.dart' as http;

class NetworkService{
  Future<LogInResponse> UserLogIn(LoginRequest loginRequest) async{
    var uri = Uri.parse("https://0f86-197-232-1-50.ngrok.io/api/login");
    Map<String, String> requestHeaders= {
      'Accept': 'application/json',
    };
    var response = await http.post(uri,
        body: loginRequest.toJson(), headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LogInResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }
  }
