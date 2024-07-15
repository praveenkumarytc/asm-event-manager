// To parse this JSON data, do
//
//     final trackListModel = trackListModelFromJson(jsonString);

import 'dart:convert';

TrackListModel trackListModelFromJson(String str) => TrackListModel.fromJson(json.decode(str));

String trackListModelToJson(TrackListModel data) => json.encode(data.toJson());

class TrackListModel {
  final int? code;
  final String? status;
  final List<Track>? tracks;

  TrackListModel({
    this.code,
    this.status,
    this.tracks,
  });

  factory TrackListModel.fromJson(Map<String, dynamic> json) => TrackListModel(
        code: json["code"],
        status: json["status"],
        tracks: json["tracks"] == null ? [] : List<Track>.from(json["tracks"]!.map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "tracks": tracks == null ? [] : List<dynamic>.from(tracks!.map((x) => x.toJson())),
      };
}

class Track {
  final int? id;
  final String? trackName;
  final String? trackImage;
  final String? trackDescription;

  Track({
    this.id,
    this.trackName,
    this.trackImage,
    this.trackDescription,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        trackName: json["track_name"],
        trackImage: json["track_image"],
        trackDescription: json["track_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "track_name": trackName,
        "track_image": trackImage,
        "track_description": trackDescription,
      };
}
