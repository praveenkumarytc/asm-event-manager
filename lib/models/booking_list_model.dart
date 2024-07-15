// To parse this JSON data, do
//
//     final bookingsListModel = bookingsListModelFromJson(jsonString);

import 'dart:convert';

BookingsListModel bookingsListModelFromJson(String str) => BookingsListModel.fromJson(json.decode(str));

String bookingsListModelToJson(BookingsListModel data) => json.encode(data.toJson());

class BookingsListModel {
  final String? status;
  final int? code;
  final List<Booking>? bookings;

  BookingsListModel({
    this.status,
    this.code,
    this.bookings,
  });

  factory BookingsListModel.fromJson(Map<String, dynamic> json) => BookingsListModel(
        status: json["status"],
        code: json["code"],
        bookings: json["bookings"] == null ? [] : List<Booking>.from(json["bookings"]!.map((x) => Booking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "bookings": bookings == null ? [] : List<dynamic>.from(bookings!.map((x) => x.toJson())),
      };
}

class Booking {
  final int? bookingId;
  final String? title;
  final String? eventId;
  final String? ticketType;
  final int? totalTicketPrice;
  final String? totalTicket;
  final DateTime? bookedDate;
  final String? heroImage;

  Booking({
    this.bookingId,
    this.title,
    this.eventId,
    this.ticketType,
    this.totalTicketPrice,
    this.totalTicket,
    this.bookedDate,
    this.heroImage,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        bookingId: json["booking_id"],
        title: json["title"],
        eventId: json["event_id"],
        ticketType: json["ticket_type"],
        totalTicketPrice: json["total_ticket_price"],
        totalTicket: json["total_ticket"],
        bookedDate: json["booked_date"] == null ? null : DateTime.parse(json["booked_date"]),
        heroImage: json["hero_image"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "title": title,
        "event_id": eventId,
        "ticket_type": ticketType,
        "total_ticket_price": totalTicketPrice,
        "total_ticket": totalTicket,
        "booked_date": bookedDate?.toIso8601String(),
        "hero_image": heroImage,
      };
}
