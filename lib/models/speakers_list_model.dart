// To parse this JSON data, do
//
//     final speakerListModel = speakerListModelFromJson(jsonString);

import 'dart:convert';

SpeakerListModel speakerListModelFromJson(String str) => SpeakerListModel.fromJson(json.decode(str));

String speakerListModelToJson(SpeakerListModel data) => json.encode(data.toJson());

class SpeakerListModel {
  final int? code;
  final String? status;
  final List<Speaker>? speakers;

  SpeakerListModel({
    this.code,
    this.status,
    this.speakers,
  });

  factory SpeakerListModel.fromJson(Map<String, dynamic> json) => SpeakerListModel(
        code: json["code"],
        status: json["status"],
        speakers: json["speakers"] == null ? [] : List<Speaker>.from(json["speakers"]!.map((x) => Speaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "speakers": speakers == null ? [] : List<dynamic>.from(speakers!.map((x) => x.toJson())),
      };
}

class Speaker {
  final int? id;
  final int? eventId;
  final String? speakerName;
  final String? speakerImage;
  final String? speakerEmail;
  final String? speakerPhone;
  final String? speakerAddress;
  final dynamic speakerDescription;
  final String? speakerOrganization;
  final String? speakerIntrest;
  final String? speakerProfile;
  final dynamic status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Speaker({
    this.id,
    this.eventId,
    this.speakerName,
    this.speakerImage,
    this.speakerEmail,
    this.speakerPhone,
    this.speakerAddress,
    this.speakerDescription,
    this.speakerOrganization,
    this.speakerIntrest,
    this.speakerProfile,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
        id: json["id"],
        eventId: json["event_id"],
        speakerName: json["speaker_name"],
        speakerImage: json["speaker_image"],
        speakerEmail: json["speaker_email"],
        speakerPhone: json["speaker_phone"],
        speakerAddress: json["speaker_address"],
        speakerDescription: json["speaker_description"],
        speakerOrganization: json["speaker_organization"],
        speakerIntrest: json["speaker_intrest"],
        speakerProfile: json["speaker_profile"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "speaker_name": speakerName,
        "speaker_image": speakerImage,
        "speaker_email": speakerEmail,
        "speaker_phone": speakerPhone,
        "speaker_address": speakerAddress,
        "speaker_description": speakerDescription,
        "speaker_organization": speakerOrganization,
        "speaker_intrest": speakerIntrest,
        "speaker_profile": speakerProfile,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
