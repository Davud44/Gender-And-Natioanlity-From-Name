// To parse this JSON data, do
//
//     final nationality = nationalityFromJson(jsonString);

import 'dart:convert';

Nationality nationalityFromJson(String str) => Nationality.fromJson(json.decode(str));

String nationalityToJson(Nationality data) => json.encode(data.toJson());

class Nationality {
  Nationality({
    this.name,
    this.country,
  });

  String? name;
  List<Country>? country;

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    name: json["name"],
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": List<dynamic>.from(country!.map((x) => x.toJson())),
  };
}

class Country {
  Country({
    this.countryId,
    this.probability,
  });

  String? countryId;
  double? probability;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["country_id"],
    probability: json["probability"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "probability": probability,
  };
}
