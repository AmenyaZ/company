/*import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';

class NetworkService {
  var baseUrl = "https://bluez1.egovernance.io/api";
  static const organizationFacility = "/watchman/facility/organizations";

  Future<Watchman_daily_response> getWatchmanList(String token) async {
    var response = await http.get(
      Uri.parse("https://bluez1.egovernance.io/api/watchman/list"),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    print("${response.request} ${response.headers}");
    if (response.statusCode == 200) {
      var jsonResult =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var checkInList = Watchman_daily_response.fromJson(jsonResult);
      print(checkInList);
      return checkInList;
    } else {
      throw Exception('Error: ${response.body}');
    }
  }

  Future<OrganizationResponse> getFacilityOrganization(
      String accessToken) async {
    var url = Uri.parse(baseUrl + organizationFacility);
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': accessToken
    };
    var response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return OrganizationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("An error occurred ${response.body}");
    }
  }

  Future<WatchmanLoginResponse> loginWatchMan(LoginRequest loginRequest) async {
    var uri = Uri.parse("https://bluez1.egovernance.io/api/watchmanlogin");
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var response = await http.post(uri,
        body: loginRequest.toJson(), headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return WatchmanLoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }

  Future<WatchmanPass> getWatchmanPass(
      String token, WatchmanPassDaily pass) async {
    print(token);
    var watchmanPassList = {
      "evt_id": int.tryParse(pass.evtId.toString()),
      "usr_id": int.tryParse(pass.usrId.toString()),
      "fcl_ent_id": int.tryParse(pass.fclEntId.toString())
    };
    print(watchmanPassList);
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': token
    };
    final response = await http.post(
        Uri.parse("https://bluez1.egovernance.io/api/watchman/pass"),
        headers: requestHeaders,
        body: jsonEncode(watchmanPassList));
    print(response.body);
    try {
      print("${response.body} ${response.headers}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var watchmanPass = WatchmanPass.fromJson(jsonDecode(response.body));
        print(watchmanPass);
        //var watchmanPass = WatchmanPass.fromJson(jsonResult);
        return watchmanPass;
      } else {
        throw Exception('Failed to load ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('${e}');
    }
  }

  Future<WatchmanCheckin> getWatchmanCheckin(String token) async {
    var response = await http.get(
      Uri.parse("https://bluez1.egovernance.io/api/watchman/checkin"),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    print("${response.request} ${response.headers}");
    if (response.statusCode == 200) {
      var jsonResult =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var checkedIn = WatchmanCheckin.fromJson(jsonResult);
      print(checkedIn);
      return checkedIn;
    } else {
      throw Exception('Failed to load ${response.body}');
    }
  }

  Future<Daily_checkout> getDailyCheckout(
      String token, Checkout_watchman checkout) async {
    print(token);
    var l = {
      "evt_id": int.tryParse(checkout.evtId.toString()),
      "usr_id": int.tryParse(checkout.usrId.toString()),
      "fcl_ent_id": int.tryParse(checkout.fclEntId.toString())
    };
    print(l);
    Map<String, String> requestHeaders = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': token
    };
    var response = await http.post(
        Uri.parse("https://bluez1.egovernance.io/api/watchman/checkout"),
        headers: requestHeaders,
        body: jsonEncode(l));
    print(response.body);
    try {
      print("${response.body} ${response.headers}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var dailycheckout = Daily_checkout.fromJson(jsonDecode(response.body));
        print(dailycheckout);
        return dailycheckout;
      } else {
        throw Exception('Failed to load ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('${e}');
    }
  }

  Future<WatchmanCheckout> getWatchmanCheckout(String token) async {
    var response = await http.get(
      Uri.parse("https://bluez1.egovernance.io/api/watchman/checkout"),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    print("${response.request} ${response.headers}");
    if (response.statusCode == 200) {
      var jsonResult =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var checkOutList = WatchmanCheckout.fromJson(jsonResult);
      print(checkOutList);
      return checkOutList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<VisitResponse> getCreateNewVisitor(
      String token, CreateVisitRequest createvisitrequest) async {
    var createVisit = {
      "fullname": createvisitrequest.fullname,
      "phone": createvisitrequest.phone,
      "category": createvisitrequest.category,
      "companyName": createvisitrequest.companyName,
      "host": createvisitrequest.host,
      "fromTime": createvisitrequest.fromTime,
      "idNumber": createvisitrequest.idNumber,
      "event_date": createvisitrequest.eventDate,
      "location": createvisitrequest.location,
      "reason": createvisitrequest.reason
    };
    print(createVisit);
    Map<String, String> requestHeaders = {
      'content-Type': 'application/json',
      'accept': 'application/json',
      'authorization': token
    };
    final response = await http.post(
        Uri.parse("https://bluez1.egovernance.io/api/pre_visits"),
        headers: requestHeaders,
        body: jsonEncode(createVisit));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var createUserVisit = VisitResponse.fromJson(jsonDecode(response.body));
        return createUserVisit;
      } else {
        throw Exception('Failed to load ${response.body}');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<FacilityResponse> getFacilityList(String token) async {
    var response = await http.get(
      Uri.parse("https://bluez1.egovernance.io/api/facility"),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    print("${response.request} ${response.headers}");
    if (response.statusCode == 200) {
      var jsonResult =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var facility = FacilityResponse.fromJson(jsonResult);
      print(facility);
      return facility;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<ImageUploadResponse> uploadImage(String accessToken,
      ImageUploadRequest request, String imageType, String userId) async {
    var uri = Uri.parse(
        "https://bluez1.egovernance.io/api/user/uploadimage/$userId/$imageType");
    Map<String, String> requestHeaders = {
      'Content-Type': "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    print(request.content);
    var response = await http.put(uri,
        headers: requestHeaders, body: jsonEncode(request.toJson()));

    if (response.statusCode == 200) {
      return ImageUploadResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }

  Future<LiveAvatarResponse> uploadAvatar(
      String accessToken, LiveAvatarRequest request) async {
    var l = {
      "evt_id": int.tryParse(request.vstId.toString()),
      "usr_id": int.tryParse(request.usrId.toString()),
      "content": int.tryParse(request.content.toString())
    };
    print(l);
    var uri =
    Uri.parse("https://bluez1.egovernance.io/api/user/liveavatar/upload");
    Map<String, String> requestHeaders = {
      'Content-Type': "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    print(request.content);
    var response = await http.post(uri,
        headers: requestHeaders, body: jsonEncode(request.toJson()));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LiveAvatarResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${response.body}");
    }
  }

  Future<ItemsResponse> getVisitAsset(
      String accessToken, String visitId, String userId) async {
    var uri = Uri.parse(
        "https://bluez1.egovernance.io/api/user/$userId/visit/$visitId/items");
    Map<String, String> requestHeaders = {
      'Content-Type': "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    var response = await http.get(uri, headers: requestHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      return ItemsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error: ${jsonDecode(response.body)}");
    }
  }
}
*/