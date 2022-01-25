// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

Gender genderFromJson(String str) => Gender.fromJson(json.decode(str));

String genderToJson(Gender data) => json.encode(data.toJson());

class Gender {
  Gender({
    this.name,
    this.gender,
    this.probability,
    this.count,
  });

  String? name;
  String? gender;
  double? probability;
  int? count;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    name: json["name"],
    gender: json["gender"],
    probability: json["probability"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "probability": probability,
    "count": count,
  };
}
