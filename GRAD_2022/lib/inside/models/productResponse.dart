// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.id,
  });

  int? id;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
      };
}
