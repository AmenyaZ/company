import 'dart:convert';

/// legal_name : "Simanzi Stores"
/// physical_location : "Killo"
/// year : "2003"
/// company_logo : "data:image/jpeg;base64,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"

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
CreateOrganizationRequest copyWith({  String? legalName,
  String? physicalLocation,
  String? year,
  String? companyLogo,
}) => CreateOrganizationRequest(  legalName: legalName ?? _legalName,
  physicalLocation: physicalLocation ?? _physicalLocation,
  year: year ?? _year,
  companyLogo: companyLogo ?? _companyLogo,
);
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