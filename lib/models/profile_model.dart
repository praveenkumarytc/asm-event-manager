// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final String? status;
  final int? code;
  final String? message;
  final UserProfile? userProfile;

  ProfileModel({
    this.status,
    this.code,
    this.message,
    this.userProfile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        userProfile: json["user_profile"] == null ? null : UserProfile.fromJson(json["user_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "user_profile": userProfile?.toJson(),
      };
}

class UserProfile {
  final int? id;
  final String? fname;
  final String? email;
  final String? phone;
  final String? photo;
  final String? countryCode;

  UserProfile({
    this.id,
    this.fname,
    this.email,
    this.phone,
    this.photo,
    this.countryCode,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        fname: json["fname"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        countryCode: json["country_code"] == null ? null : json["country_code"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "email": email,
        "phone": phone,
        "photo": photo,
        "country_code": countryCode,
      };
}
