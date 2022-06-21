// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.addersses,
    this.isactive,
    this.logins,
  });

  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? addersses;
  int? isactive;
  List<Login>? logins;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        addersses: json["addersses"],
        isactive: json["isactive"],
        logins: List<Login>.from(json["logins"].map((x) => Login.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "addersses": addersses,
        "isactive": isactive,
        "logins": List<dynamic>.from(logins!.map((x) => x.toJson())),
      };
}

class Login {
  Login({
    this.id,
    this.status,
    this.isactive,
    this.time,
    this.deviceIp,
    this.userId,
  });

  int? id;
  String? status;
  int? isactive;
  DateTime? time;
  String? deviceIp;
  int? userId;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        status: json["status"],
        isactive: json["isactive"],
        time: DateTime.parse(json["time"]),
        deviceIp: json["deviceIp"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "isactive": isactive,
        "time": time?.toIso8601String(),
        "deviceIp": deviceIp,
        "userId": userId,
      };
}
