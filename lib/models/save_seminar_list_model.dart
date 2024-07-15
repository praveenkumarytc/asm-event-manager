// To parse this JSON data, do
//
//     final saveSeminarListModel = saveSeminarListModelFromJson(jsonString);

import 'dart:convert';

import 'package:event_app/models/speaker_seminar_model.dart';

SaveSeminarListModel saveSeminarListModelFromJson(String str) => SaveSeminarListModel.fromJson(json.decode(str));

String saveSeminarListModelToJson(SaveSeminarListModel data) => json.encode(data.toJson());

class SaveSeminarListModel {
  final String? status;
  final int? code;
  final List<Seminar>? savedSeminar;

  SaveSeminarListModel({
    this.status,
    this.code,
    this.savedSeminar,
  });

  factory SaveSeminarListModel.fromJson(Map<String, dynamic> json) => SaveSeminarListModel(
        status: json["status"],
        code: json["code"],
        savedSeminar: json["saved_seminar"] == null ? [] : List<Seminar>.from(json["saved_seminar"]!.map((x) => Seminar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "saved_seminar": savedSeminar == null ? [] : List<dynamic>.from(savedSeminar!.map((x) => x.toJson())),
      };
}
