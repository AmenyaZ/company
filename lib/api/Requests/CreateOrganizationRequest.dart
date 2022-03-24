import 'dart:convert';

/// legal_name : "Shivling Stores"
/// physical_location : "Kisii"
/// year : "2006"
/// company_logo : "gitlab"

CreateOrganizationRequest createOrganizationRequestFromJson(String str) => CreateOrganizationRequest.fromJson(json.decode(str));
String createOrganizationRequestToJson(CreateOrganizationRequest data) => json.encode(data.toJson());
class CreateOrganizationRequest {
  CreateOrganizationRequest({
      String? legalName, 
      String? physicalLocation, 
      String? year, 
      String? companyLogo,}){
    _legalName = legalName;
    _physicalLocation = physicalLocation;
    _year = year;
    _companyLogo = companyLogo;
}

  CreateOrganizationRequest.fromJson(dynamic json) {
    _legalName = json['legal_name'];
    _physicalLocation = json['physical_location'];
    _year = json['year'];
    _companyLogo = json['company_logo'];
  }
  String? _legalName;
  String? _physicalLocation;
  String? _year;
  String? _companyLogo;

  String? get legalName => _legalName;
  String? get physicalLocation => _physicalLocation;
  String? get year => _year;
  String? get companyLogo => _companyLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['legal_name'] = _legalName;
    map['physical_location'] = _physicalLocation;
    map['year'] = _year;
    map['company_logo'] = _companyLogo;
    return map;
  }

}