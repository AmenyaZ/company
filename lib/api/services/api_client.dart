import 'dart:convert';
import 'package:company/api/Requests/CreateRoleRequest.dart';
import 'package:company/api/Requests/LoginRequest.dart';
import 'package:company/api/Requests/OrganizationUserRequest.dart';
import 'package:company/api/Requests/RegistrationRequest.dart';
import 'package:company/api/Requests/RoleUserRequest.dart';
import 'package:company/api/Response/CreateRoles/CreateRoleResponse.dart';
import 'package:company/api/Response/ListRoles/ListRolesResponse.dart';
import 'package:company/api/Response/ListUsers/ListUsersResponse.dart';
import 'package:company/api/Response/Login/LogInResponse.dart';
import 'package:company/api/Response/OrganizationUser/OrganizationUserResponse.dart';
import 'package:company/api/Response/Registration/RegistrationResponse.dart';
import 'package:company/local/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../Response/ListOrganization/ListOrganizationResponse.dart';
import '../Response/RoleUser/RoleUserResponse.dart';

class NetworkService {
  final String url = 'https://e196-197-232-1-50.ngrok.io/api';
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

  Future<RegistrationResponse> UserRegistration(RegistrationRequest registrationRequest,String token) async {
    var uri = Uri.parse(url + "/register");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
     "Authorization":"Bearer $token"
    };
    var response = await http.post(uri,
        body: registrationRequest.toJson(), headers: requestHeaders);
    print(registrationRequest.toJson());
    print("register Response${response.statusCode}");
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
    //print('Response ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ListRolesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }
  Future<ListUsersResponse> UserList(String token) async {
    var uri = Uri.parse(url + "/user");
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
  Future<OrganizationUserResponse> OrganizationUser( OrganizationUserRequest organizationUserRequest, String token) async {
    var uri = Uri.parse(url + "/userorganization");
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      // 'Content-Type': 'application/json',
     "Authorization": "Bearer $token"
    };
    var response = await http.post( uri,
        body: organizationUserRequest.toJson(),
        headers: requestHeaders);
    print(organizationUserRequest.toJson());
    print("Response${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return OrganizationUserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load ${response.body}');
    }
  }
  Future<RoleUserResponse> RoleUser(RoleUserRequest roleUserRequest, String token) async{
    var uri = Uri.parse(url+ "/userrole");
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      "Authorization": "Bearer $token"
    };
    var response = await http.post(uri,
    body: roleUserRequest.toJson(),
    headers: requestHeaders);
    print(roleUserRequest.toJson());
    print("Role Response ${response.statusCode}");
    if(response.statusCode == 200 || response.statusCode == 201){
      return RoleUserResponse.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load ${response.body}');
    }
  }
  Future<CreateRoleResponse> CreateRole(CreateRoleRequest createRoleRequest, String token) async{
    var uri = Uri.parse(url+ "/role");
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      "Authorization": "Bearer $token"
    };
    var response = await http.post(uri,
      body: createRoleRequest.toJson(),
      headers: requestHeaders
    );
    print(createRoleRequest.toJson());
    print(jsonDecode(response.body));
    print(response.statusCode);
    if(response.statusCode ==200 || response.statusCode == 201){
      return CreateRoleResponse.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to Load ${response.body}");
    }
  }
}
