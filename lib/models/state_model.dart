class StateModel {
  final String state;
  final String countryCode;
  final String stateCode;

  StateModel({
    required this.state,
    required this.countryCode,
    required this.stateCode,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      state: json['state'],
      countryCode: json['countryCode'],
      stateCode: json['stateCode'],
    );
  }
}
