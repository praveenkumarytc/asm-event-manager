// To parse this JSON data, do
//
//     final speakerSeminarModel = speakerSeminarModelFromJson(jsonString);

import 'dart:convert';

import 'package:event_app/models/seminar_listing_model.dart';

SpeakerSeminarModel speakerSeminarModelFromJson(String str) => SpeakerSeminarModel.fromJson(json.decode(str));

String speakerSeminarModelToJson(SpeakerSeminarModel data) => json.encode(data.toJson());

class SpeakerSeminarModel {
  final String? status;
  final int? code;
  final List<Seminar>? seminars;
  final String? message;

  SpeakerSeminarModel({
    this.status,
    this.code,
    this.seminars,
    this.message,
  });

  factory SpeakerSeminarModel.fromJson(Map<String, dynamic> json) => SpeakerSeminarModel(
        status: json["status"],
        code: json["code"],
        seminars: json["seminars"] == null ? [] : List<Seminar>.from(json["seminars"]!.map((x) => Seminar.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "seminars": seminars == null ? [] : List<dynamic>.from(seminars!.map((x) => x.toJson())),
        "message": message,
      };
}

class Seminar {
  final int? seminarId;
  final int? id;
  final String? seminarsName;
  final String? seminarsDescription;
  final String? seminarsImages;
  final List<Speaker>? speakers;

  Seminar({
    this.seminarId,
    this.seminarsName,
    this.seminarsDescription,
    this.seminarsImages,
    this.speakers,
    this.id,
  });

  factory Seminar.fromJson(Map<String, dynamic> json) => Seminar(
        seminarId: json["seminar_id"],
        seminarsName: json["seminars_name"],
        seminarsDescription: json["seminars_description"],
        seminarsImages: json["seminars_images"],
        id: json["id"],
        speakers: json["speakers"] == null ? [] : List<Speaker>.from(json["speakers"]!.map((x) => Speaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seminar_id": seminarId,
        "seminars_name": seminarsName,
        "seminars_description": seminarsDescription,
        "seminars_images": seminarsImages,
        "id": id,
        "speakers": speakers == null ? [] : List<dynamic>.from(speakers!.map((x) => x.toJson())),
      };
}
