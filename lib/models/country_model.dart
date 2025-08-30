class CountryModel{
  final String country;
  final String isoCode;

  CountryModel({required this.country, required this.isoCode,});

  factory CountryModel.fromJson(Map<String,dynamic> json){
   return CountryModel(country: json['country'], isoCode: json['isoCode']);
  } 
}