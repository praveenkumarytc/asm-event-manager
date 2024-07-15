// To parse this JSON data, do
//
//     final scanResponseModel = scanResponseModelFromJson(jsonString);

import 'dart:convert';

ScanResponseModel scanResponseModelFromJson(String str) => ScanResponseModel.fromJson(json.decode(str));

String scanResponseModelToJson(ScanResponseModel data) => json.encode(data.toJson());

class ScanResponseModel {
  final String? status;
  final String? message;
  final TicketDetails? ticketDetails;

  ScanResponseModel({
    this.status,
    this.message,
    this.ticketDetails,
  });

  factory ScanResponseModel.fromJson(Map<String, dynamic> json) => ScanResponseModel(
        status: json["status"],
        message: json["message"],
        ticketDetails: json["ticket_details"] == null ? null : TicketDetails.fromJson(json["ticket_details"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "ticket_details": ticketDetails?.toJson(),
      };
}

class TicketDetails {
  final int? id;
  final String? bookingId;
  final int? price;
  final String? quantity;
  final int? ticketType;
  final int? scanStatus;
  final String? fname;
  final String? lname;

  TicketDetails({
    this.id,
    this.bookingId,
    this.price,
    this.quantity,
    this.ticketType,
    this.scanStatus,
    this.fname,
    this.lname,
  });

  factory TicketDetails.fromJson(Map<String, dynamic> json) => TicketDetails(
        id: json["id"],
        bookingId: json["booking_id"],
        price: json["price"],
        quantity: json["quantity"],
        ticketType: json["ticket_type"],
        scanStatus: json["scan_status"],
        fname: json["fname"],
        lname: json["lname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "price": price,
        "quantity": quantity,
        "ticket_type": ticketType,
        "scan_status": scanStatus,
        "fname": fname,
        "lname": lname,
      };
}
