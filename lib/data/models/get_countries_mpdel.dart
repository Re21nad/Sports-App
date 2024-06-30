class GetCountryModel {
  final int countryKey;
  final String countryName;
  final String? countryIso2;
  final String countryLogo;

  GetCountryModel({
    required this.countryKey,
    required this.countryName,
    this.countryIso2,
    required this.countryLogo,
  });

  factory GetCountryModel.fromJson(Map<String, dynamic> json) {
    return GetCountryModel(
      countryKey: json['country_key'] ?? 0,
      countryName: json['country_name'] ?? "",
      countryIso2: json['country_iso2'] ?? "",
      countryLogo: json['country_logo'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_key': countryKey,
      'country_name': countryName,
      'country_iso2': countryIso2,
      'country_logo': countryLogo,
    };
  }
}

class ApiResponse {
  final int success;
  final List<GetCountryModel> result;

  ApiResponse({
    required this.success,
    required this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List;
    List<GetCountryModel> countryList =
        list.map((i) => GetCountryModel.fromJson(i)).toList();

    return ApiResponse(
      success: json['success'],
      result: countryList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'result': result.map((country) => country.toJson()).toList(),
    };
  }
}