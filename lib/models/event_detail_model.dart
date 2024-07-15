// To parse this JSON data, do
//
//     final eventDetailModel = eventDetailModelFromJson(jsonString);

import 'dart:convert';

EventDetailModel eventDetailModelFromJson(String str) => EventDetailModel.fromJson(json.decode(str));

String eventDetailModelToJson(EventDetailModel data) => json.encode(data.toJson());

class EventDetailModel {
  final String? status;
  final int? code;
  final Data? data;

  EventDetailModel({
    this.status,
    this.code,
    this.data,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) => EventDetailModel(
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  final String? startDate;
  final String? startTime;
  final String? endDate;
  final String? endTime;
  final dynamic latitude;
  final dynamic longitude;
  final String? duration;
  final dynamic id;
  final String? eventId;
  final int? languageId;
  final int? eventCategoryId;
  final String? title;
  final dynamic subTitle;
  final String? slug;
  final String? description;
  final String? boothImage;
  final dynamic heroImage;
  final dynamic infoImage;
  final dynamic metaKeywords;
  final dynamic metaDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? address;
  final String? country;
  final dynamic state;
  final String? city;
  final dynamic zipCode;
  final dynamic googleCalendarId;
  final dynamic refundPolicy;
  final String? thumbnail;
  final dynamic participantsName;
  final dynamic participantsImage;
  final List<Speaker>? speakers;

  Data({
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.latitude,
    this.longitude,
    this.duration,
    this.id,
    this.eventId,
    this.languageId,
    this.eventCategoryId,
    this.title,
    this.subTitle,
    this.slug,
    this.description,
    this.boothImage,
    this.heroImage,
    this.infoImage,
    this.metaKeywords,
    this.metaDescription,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.googleCalendarId,
    this.refundPolicy,
    this.thumbnail,
    this.participantsName,
    this.participantsImage,
    this.speakers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        startDate: json["start_date"],
        startTime: json["start_time"],
        endDate: json["end_date"],
        endTime: json["end_time"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        duration: json["duration"],
        id: json["id"],
        eventId: json["event_id"].toString(),
        languageId: json["language_id"],
        eventCategoryId: json["event_category_id"],
        title: json["title"],
        subTitle: json["sub_title"],
        slug: json["slug"],
        description: json["description"],
        boothImage: json["booth_image"],
        heroImage: json["hero_image"],
        infoImage: json["info_image"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        address: json["address"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zip_code"],
        googleCalendarId: json["google_calendar_id"],
        refundPolicy: json["refund_policy"],
        thumbnail: json["thumbnail"],
        participantsName: json["participants_name"],
        participantsImage: json["participants_image"],
        speakers: json["speakers"] == null ? [] : List<Speaker>.from(json["speakers"]!.map((x) => Speaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "start_time": startTime,
        "end_date": endDate,
        "end_time": endTime,
        "latitude": latitude,
        "longitude": longitude,
        "duration": duration,
        "id": id,
        "event_id": eventId,
        "language_id": languageId,
        "event_category_id": eventCategoryId,
        "title": title,
        "sub_title": subTitle,
        "slug": slug,
        "description": description,
        "booth_image": boothImage,
        "hero_image": heroImage,
        "info_image": infoImage,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "address": address,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "google_calendar_id": googleCalendarId,
        "refund_policy": refundPolicy,
        "thumbnail": thumbnail,
        "participants_name": participantsName,
        "participants_image": participantsImage,
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
