// To parse this JSON data, do
//
//     final courtModel = courtModelFromJson(jsonString);

import 'dart:convert';

CourtModel courtModelFromJson(String str) => CourtModel.fromJson(json.decode(str));

String courtModelToJson(CourtModel data) => json.encode(data.toJson());
List<CourtModel> courtModelListFromJson(String str) => (jsonDecode(str) as List<dynamic>).map((e) => CourtModel.fromJson(e)).toList();

class CourtModel {
  final int id;
  final String nameCourt;
  final String date;
  final String nameUser;
  final String changeOfRain;
  final String createdAt;

  CourtModel({
    required this.id,
    required this.nameCourt,
    required this.date,
    required this.nameUser,
    required this.changeOfRain,
    required this.createdAt,
  });

  CourtModel copyWith({
    int? id,
    String? nameCourt,
    String? date,
    String? nameUser,
    String? changeOfRain,
    String? createdAt,
  }) =>
      CourtModel(
        id: id ?? this.id,
        nameCourt: nameCourt ?? this.nameCourt,
        date: date ?? this.date,
        nameUser: nameUser ?? this.nameUser,
        changeOfRain: changeOfRain ?? this.changeOfRain,
        createdAt: createdAt ?? this.createdAt,
      );

  factory CourtModel.fromJson(Map<String, dynamic> json) => CourtModel(
        nameCourt: json["nameCourt"],
        id: json["id"],
        date: json["date"],
        nameUser: json["nameUser"],
        changeOfRain: json["changeOfRain"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameCourt": nameCourt,
        "date": date,
        "nameUser": nameUser,
        "changeOfRain": changeOfRain,
        "createdAt": createdAt,
      };
}
