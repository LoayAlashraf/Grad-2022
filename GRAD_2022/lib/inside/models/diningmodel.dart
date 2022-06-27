// To parse this JSON data, do
//
//     final diningModel = diningModelFromJson(jsonString);

import 'dart:convert';

DiningModel diningModelFromJson(String str) => DiningModel.fromJson(json.decode(str));

String diningModelToJson(DiningModel data) => json.encode(data.toJson());

class DiningModel {
  DiningModel({
    this.id,
    this.name,
    this.image,
    this.logo,
    this.level,
    this.diningId,
    this.phonenumber,
    this.email,
    this.website,
  });

  int ?id;
  String? name;
  String ?image;
  String ?logo;
  int ?level;
  int ?diningId;
  String? phonenumber;
  String? email;
  String? website;

  factory DiningModel.fromJson(Map<String, dynamic> json) => DiningModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    logo: json["logo"],
    level: json["level"],
    diningId: json["diningId"],
    phonenumber: json["phonenumber"],
    email: json["email"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "logo": logo,
    "level": level,
    "diningId": diningId,
    "phonenumber": phonenumber,
    "email": email,
    "website": website,
  };
}
