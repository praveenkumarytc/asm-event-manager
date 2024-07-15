// To parse this JSON data, do
//
//     final eventListModel = eventListModelFromJson(jsonString);

import 'dart:convert';

EventListModel eventListModelFromJson(String str) => EventListModel.fromJson(json.decode(str));

String eventListModelToJson(EventListModel data) => json.encode(data.toJson());

class EventListModel {
  final String? status;
  final List<Event>? events;

  EventListModel({
    this.status,
    this.events,
  });

  factory EventListModel.fromJson(Map<String, dynamic> json) => EventListModel(
        status: json["status"],
        events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Event {
  final int? id;
  final String? title;
  final String? description;
  final String? address;
  final String? country;
  final String? startDate;
  final String? startTime;
  final String? endDate;
  final String? endTime;
  final String? thumbnail;

  Event({
    this.id,
    this.title,
    this.description,
    this.address,
    this.country,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.thumbnail,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        country: json["country"],
        startDate: json["start_date"],
        startTime: json["start_time"],
        endDate: json["end_date"],
        endTime: json["end_time"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "title": title,
        // "description": description,
        // "address": address,
        // "country": country,
        // "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        // "start_time": startTime,
        // "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        // "end_time": endTime,
        // "thumbnail": thumbnail,
      };
}
