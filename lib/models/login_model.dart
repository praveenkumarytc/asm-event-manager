// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? status;
  final String? message;
  final User? user;

  LoginModel({
    this.status,
    this.message,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? fname;
  final String? email;
  final String? phone;
  final String? connectionId;
  final String? authCode;

  User({
    this.id,
    this.fname,
    this.email,
    this.phone,
    this.connectionId,
    this.authCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        email: json["email"],
        phone: json["phone"],
        connectionId: json["connection_id"],
        authCode: json["auth_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "email": email,
        "phone": phone,
        "connection_id": connectionId,
        "auth_code": authCode,
      };
}
