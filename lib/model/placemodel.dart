// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';



class Place {
  Place({
    required this.place,
    required this.country,
  });

  String place;
  String country;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        place: json["place"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "country": country,
      };
}
