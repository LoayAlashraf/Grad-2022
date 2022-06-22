// To parse this JSON data, do
//
//     final couponNameModel = couponNameModelFromJson(jsonString);

import 'dart:convert';

List<CouponNameModel> couponNameModelFromJson(String str) => List<CouponNameModel>.from(json.decode(str).map((x) => CouponNameModel.fromJson(x)));

String couponNameModelToJson(List<CouponNameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponNameModel {
  CouponNameModel({
    this.id,
    this.couponName,
    this.discount,
  });

  int? id;
  int? couponName;
  int? discount;

  factory CouponNameModel.fromJson(Map<String, dynamic> json) => CouponNameModel(
    id: json["id"],
    couponName: json["couponName"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "couponName": couponName,
    "discount": discount,
  };
}
