class CityModel {
  final String countryCode;
  final String stateCode;
  final String city;

  CityModel({
    required this.countryCode,
    required this.stateCode,
    required this.city,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      countryCode: json['countryCode'],
      stateCode: json['stateCode'],
      city: json['city'],
    );
  }
}
