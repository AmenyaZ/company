import 'dart:convert';
import 'package:company/api/Requests/LoginRequest.dart';
import 'package:company/api/Requests/RegistrationRequest.dart';
import 'package:company/api/Response/ListRolesResponse.dart';
import 'package:company/api/Response/ListUsersResponse.dart';
import 'package:company/api/Response/LogInResponse.dart';
import 'package:company/api/Response/RegistrationResponse.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../Response/ListOrganizationResponse.dart';

class NetworkService {
  final String url = 'https://6821-197-232-1-50.ngrok.io/api';
  final sp = SharedPreferenceHelper();

  Future<LogInResponse> UserLogIn(LoginRequest loginRequest) async {
    var uri = Uri.parse(url + "/login");
    Map<String, String> requestHeaders = {
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

  Future<RegistrationResponse> UserRegistration(
      RegistrationRequest registrationRequest) async {
    var uri = Uri.parse(url + "/register");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',

    };
    var response = await http.post(uri,
        body: registrationRequest.toJson(), headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }

  Future<ListOrganizationResponse> OrganizationList(String token) async {
    var uri = Uri.parse(url + "/organization");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization":"Bearer $token"
    };
    var response = await http.get(uri,
         headers: requestHeaders );
   // print('Response ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {

      return ListOrganizationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }
  Future<ListRolesResponse> RoleList(String token) async {
    var uri = Uri.parse(url + "/role");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization":"Bearer $token"
    };
    var response = await http.get(uri,
        headers: requestHeaders );
    print('Response ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ListRolesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }
  Future<ListUsersResponse> UserList(String token) async {
    var uri = Uri.parse(url + "/role");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization":"Bearer $token"
    };
    var response = await http.get(uri,
        headers: requestHeaders );
    print('Response ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ListUsersResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }


}
