// To parse this JSON data, do
//
//     final bookingSuccessModel = bookingSuccessModelFromJson(jsonString);

import 'dart:convert';

BookingSuccessModel bookingSuccessModelFromJson(String str) => BookingSuccessModel.fromJson(json.decode(str));

String bookingSuccessModelToJson(BookingSuccessModel data) => json.encode(data.toJson());

class BookingSuccessModel {
  final int? code;
  final String? status;
  final int? bookingId;
  final String? message;

  BookingSuccessModel({
    this.code,
    this.status,
    this.bookingId,
    this.message,
  });

  factory BookingSuccessModel.fromJson(Map<String, dynamic> json) => BookingSuccessModel(
        code: json["code"],
        status: json["status"],
        bookingId: json["booking_id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "booking_id": bookingId,
        "message": message,
      };
}
