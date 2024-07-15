// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
  final int? code;
  final String? status;
  final String? message;
  final String? authCode;

  RegistrationModel({
    this.code,
    this.status,
    this.message,
    this.authCode,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        authCode: json["auth_code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "auth_code": authCode,
      };
}
