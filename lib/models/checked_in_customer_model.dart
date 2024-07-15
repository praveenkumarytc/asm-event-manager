// To parse this JSON data, do
//
//     final checkedInCustomersModel = checkedInCustomersModelFromJson(jsonString);

import 'dart:convert';

CheckedInCustomersModel checkedInCustomersModelFromJson(String str) => CheckedInCustomersModel.fromJson(json.decode(str));

String checkedInCustomersModelToJson(CheckedInCustomersModel data) => json.encode(data.toJson());

class CheckedInCustomersModel {
  final String? status;
  final String? message;
  final List<ListElement>? list;

  CheckedInCustomersModel({
    this.status,
    this.message,
    this.list,
  });

  factory CheckedInCustomersModel.fromJson(Map<String, dynamic> json) => CheckedInCustomersModel(
        status: json["status"],
        message: json["message"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  final int? id;
  final String? bookingId;
  final int? price;
  final String? quantity;
  final int? ticketType;
  final int? scanStatus;
  final String? fname;
  final String? lname;

  ListElement({
    this.id,
    this.bookingId,
    this.price,
    this.quantity,
    this.ticketType,
    this.scanStatus,
    this.fname,
    this.lname,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
