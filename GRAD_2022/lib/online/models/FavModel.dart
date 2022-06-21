// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  FavModel({
    this.id,
    this.userId,
    this.productId,
    this.productName,
    this.productImage,
    this.productDiscount,
    this.productCost,
    this.producCount,
    this.isCart,
    this.isActive,
  });

  int? id;
  int? userId;
  int? productId;
  String? productName;
  String? productImage;
  String? productDiscount;
  String? productCost;
  String? producCount;
  bool? isCart;
  bool? isActive;

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
    id: json["id"],
    userId: json["userId"],
    productId: json["productId"],
    productName: json["productName"],
    productImage: json["productImage"],
    productDiscount: json["productDiscount"],
    productCost: json["productCost"],
    producCount: json["producCount"],
    isCart: json["is_Cart"],
    isActive: json["is_Active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productId": productId,
    "productName": productName,
    "productImage": productImage,
    "productDiscount": productDiscount,
    "productCost": productCost,
    "producCount": producCount,
    "is_Cart": isCart,
    "is_Active": isActive,
  };
}
