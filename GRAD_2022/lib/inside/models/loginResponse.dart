// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.email,
    this.password,
    this.id
  });

  String? email;
  String ?password;
  int? id;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    email: json["email"],
    password: json["password"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "id": id,
  };
}
