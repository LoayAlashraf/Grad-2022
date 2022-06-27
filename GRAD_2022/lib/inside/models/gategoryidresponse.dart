// To parse this JSON data, do
//
//     final gategoryIdResponse = gategoryIdResponseFromJson(jsonString);

import 'dart:convert';

List<GategoryIdResponse> gategoryIdResponseFromJson(String str) =>
    List<GategoryIdResponse>.from(
        json.decode(str).map((x) => GategoryIdResponse.fromJson(x)));

String gategoryIdResponseToJson(List<GategoryIdResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GategoryIdResponse {
  GategoryIdResponse({
    this.id,
    this.name,
    this.cost,
    this.discount,
    this.image,
    this.rfidCode,
    this.description,
    this.category,
    this.idCategory,
    this.prand,
    this.count,
    this.sellername,
  });

  int? id;
  String? name;
  double? cost;
  int? discount;
  String? image;
  String? rfidCode;
  String? description;
  String? category;
  int? idCategory;
  String? prand;
  int? count;
  String? sellername;

  factory GategoryIdResponse.fromJson(Map<String, dynamic> json) =>
      GategoryIdResponse(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        discount: json["discount"],
        image: json["image"],
        rfidCode: json["rfidCode"],
        description: json["description"],
        category: json["category"],
        idCategory: json["idCategory"],
        prand: json["prand"],
        count: json["count"],
        sellername: json["sellername"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "discount": discount,
        "image": image,
        "rfidCode": rfidCode,
        "description": description,
        "category": category,
        "idCategory": idCategory,
        "prand": prand,
        "count": count,
        "sellername": sellername,
      };
}
