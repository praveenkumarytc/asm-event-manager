// To parse this JSON data, do
//
//     final seminarDetailModel = seminarDetailModelFromJson(jsonString);

import 'dart:convert';

SeminarDetailModel seminarDetailModelFromJson(String str) => SeminarDetailModel.fromJson(json.decode(str));

String seminarDetailModelToJson(SeminarDetailModel data) => json.encode(data.toJson());

class SeminarDetailModel {
  final int? code;
  final String? status;
  final Seminar? seminar;

  SeminarDetailModel({
    this.code,
    this.status,
    this.seminar,
  });

  factory SeminarDetailModel.fromJson(Map<String, dynamic> json) => SeminarDetailModel(
        code: json["code"],
        status: json["status"],
        seminar: json["seminar"] == null ? null : Seminar.fromJson(json["seminar"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "seminar": seminar?.toJson(),
      };
}

class Seminar {
  final int? id;
  final String? seminarsName;
  final String? seminarsImages;
  final DateTime? seminarsDate;
  final String? seminarsStartTime;
  final String? seminarsEndTime;
  final String? seminarsDescription;
  final List<Speaker>? speakers;
  final HallDetails? hallDetails;
  final int? isSaved;

  Seminar({
    this.id,
    this.seminarsName,
    this.seminarsImages,
    this.seminarsDate,
    this.seminarsStartTime,
    this.seminarsEndTime,
    this.seminarsDescription,
    this.speakers,
    this.hallDetails,
    this.isSaved,
  });

  factory Seminar.fromJson(Map<String, dynamic> json) => Seminar(
        id: json["id"],
        seminarsName: json["seminars_name"],
        seminarsImages: json["seminars_images"],
        seminarsDate: json["seminars_date"] == null ? null : DateTime.parse(json["seminars_date"]),
        seminarsStartTime: json["seminars_start_time"],
        seminarsEndTime: json["seminars_end_time"],
        seminarsDescription: json["seminars_description"],
        speakers: json["speakers"] == null ? [] : List<Speaker>.from(json["speakers"]!.map((x) => Speaker.fromJson(x))),
        hallDetails: json["hall_details"] == null ? null : HallDetails.fromJson(json["hall_details"]),
        isSaved: json["is_saved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seminars_name": seminarsName,
        "seminars_images": seminarsImages,
        "seminars_date": "${seminarsDate!.year.toString().padLeft(4, '0')}-${seminarsDate!.month.toString().padLeft(2, '0')}-${seminarsDate!.day.toString().padLeft(2, '0')}",
        "seminars_start_time": seminarsStartTime,
        "seminars_end_time": seminarsEndTime,
        "seminars_description": seminarsDescription,
        "speakers": speakers == null ? [] : List<dynamic>.from(speakers!.map((x) => x.toJson())),
        "hall_details": hallDetails?.toJson(),
        "is_saved": isSaved,
      };
}

class HallDetails {
  final String? hallName;
  final String? hallDescription;
  final String? hallLat;
  final String? hallLang;

  HallDetails({
    this.hallName,
    this.hallDescription,
    this.hallLat,
    this.hallLang,
  });

  factory HallDetails.fromJson(Map<String, dynamic> json) => HallDetails(
        hallName: json["hall_name"],
        hallDescription: json["hall_description"],
        hallLat: json["hall_lat"],
        hallLang: json["hall_lang"],
      );

  Map<String, dynamic> toJson() => {
        "hall_name": hallName,
        "hall_description": hallDescription,
        "hall_lat": hallLat,
        "hall_lang": hallLang,
      };
}

class Speaker {
  final int? speakerId;
  final String? speakerName;
  final String? speakerImage;

  Speaker({
    this.speakerId,
    this.speakerName,
    this.speakerImage,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
        speakerId: json["speaker_id"],
        speakerName: json["speaker_name"],
        speakerImage: json["speaker_image"],
      );

  Map<String, dynamic> toJson() => {
        "speaker_id": speakerId,
        "speaker_name": speakerName,
        "speaker_image": speakerImage,
      };
}
