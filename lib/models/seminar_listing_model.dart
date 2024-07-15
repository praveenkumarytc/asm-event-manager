// To parse this JSON data, do
//
//     final seminarListingModel = seminarListingModelFromJson(jsonString);

import 'dart:convert';

SeminarListingModel seminarListingModelFromJson(String str) => SeminarListingModel.fromJson(json.decode(str));

String seminarListingModelToJson(SeminarListingModel data) => json.encode(data.toJson());

class SeminarListingModel {
  final int? code;
  final String? status;
  final List<FastFiling>? seminars;
  final List<FastFiling>? fastFiling;

  SeminarListingModel({
    this.code,
    this.status,
    this.seminars,
    this.fastFiling,
  });

  factory SeminarListingModel.fromJson(Map<String, dynamic> json) => SeminarListingModel(
        code: json["code"],
        status: json["status"],
        seminars: json["seminars"] == null ? [] : List<FastFiling>.from(json["seminars"]!.map((x) => FastFiling.fromJson(x))),
        fastFiling: json["fast_filing"] == null ? [] : List<FastFiling>.from(json["fast_filing"]!.map((x) => FastFiling.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "seminars": seminars == null ? [] : List<dynamic>.from(seminars!.map((x) => x.toJson())),
        "fast_filing": fastFiling == null ? [] : List<dynamic>.from(fastFiling!.map((x) => x.toJson())),
      };
}

class FastFiling {
  final int? id;
  final String? seminarsName;
  final String? seminarsImages;
  final DateTime? seminarsDate;
  final String? seminarsStartTime;
  final String? seminarsEndTime;
  final List<Speaker>? speakers;

  FastFiling({
    this.id,
    this.seminarsName,
    this.seminarsImages,
    this.seminarsDate,
    this.seminarsStartTime,
    this.seminarsEndTime,
    this.speakers,
  });

  factory FastFiling.fromJson(Map<String, dynamic> json) => FastFiling(
        id: json["id"],
        seminarsName: json["seminars_name"],
        seminarsImages: json["seminars_images"],
        seminarsDate: json["seminars_date"] == null ? null : DateTime.parse(json["seminars_date"]),
        seminarsStartTime: json["seminars_start_time"],
        seminarsEndTime: json["seminars_end_time"],
        speakers: json["speakers"] == null ? [] : List<Speaker>.from(json["speakers"]!.map((x) => Speaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seminars_name": seminarsName,
        "seminars_images": seminarsImages,
        "seminars_date": "${seminarsDate!.year.toString().padLeft(4, '0')}-${seminarsDate!.month.toString().padLeft(2, '0')}-${seminarsDate!.day.toString().padLeft(2, '0')}",
        "seminars_start_time": seminarsStartTime,
        "seminars_end_time": seminarsEndTime,
        "speakers": speakers == null ? [] : List<dynamic>.from(speakers!.map((x) => x.toJson())),
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
