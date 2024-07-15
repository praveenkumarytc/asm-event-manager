// To parse this JSON data, do
//
//     final commonModel = commonModelFromJson(jsonString);

import 'dart:convert';

CommonModel commonModelFromJson(String str) => CommonModel.fromJson(json.decode(str));

String commonModelToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel {
  String? status;
  String? connectionId;
  String? authCode;
  String? message;
  int? code;

  CommonModel({
    this.status,
    this.connectionId,
    this.authCode,
    this.message,
    this.code,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
        status: json["status"],
        connectionId: json["connection_id"],
        authCode: json["auth_code"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "connection_id": connectionId,
        "auth_code": authCode,
        "message": message,
        "code": code,
      };
}
