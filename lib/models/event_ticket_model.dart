// To parse this JSON data, do
//
//     final eventTicketModel = eventTicketModelFromJson(jsonString);

import 'dart:convert';

EventTicketModel eventTicketModelFromJson(String str) => EventTicketModel.fromJson(json.decode(str));

String eventTicketModelToJson(EventTicketModel data) => json.encode(data.toJson());

class EventTicketModel {
  final String? status;
  final int? code;
  final BookingDetail? bookingDetail;
  final String? pdfLink;

  EventTicketModel({
    this.status,
    this.code,
    this.bookingDetail,
    this.pdfLink,
  });

  factory EventTicketModel.fromJson(Map<String, dynamic> json) => EventTicketModel(
        status: json["status"],
        code: json["code"],
        bookingDetail: json["booking_detail"] == null ? null : BookingDetail.fromJson(json["booking_detail"]),
        pdfLink: json["pdf_link"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "booking_detail": bookingDetail?.toJson(),
        "pdf_link": pdfLink,
      };
}

class BookingDetail {
  final int? id;
  final String? customerId;
  final String? bookingId;
  final int? ticketId;
  final dynamic eventId;
  final dynamic organizerId;
  final String? fname;
  final dynamic lname;
  final dynamic email;
  final dynamic phone;
  final dynamic country;
  final dynamic state;
  final dynamic city;
  final dynamic zipCode;
  final dynamic address;
  final dynamic variation;
  final int? price;
  final String? quantity;
  final dynamic discount;
  final int? tax;
  final int? commission;
  final dynamic earlyBirdDiscount;
  final dynamic currencyText;
  final dynamic currencyTextPosition;
  final dynamic currencySymbol;
  final dynamic currencySymbolPosition;
  final dynamic paymentMethod;
  final dynamic gatewayType;
  final dynamic paymentStatus;
  final dynamic invoice;
  final dynamic attachmentFile;
  final String? eventDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? taxPercentage;
  final int? commissionPercentage;
  final int? scanStatus;

  BookingDetail({
    this.id,
    this.customerId,
    this.bookingId,
    this.ticketId,
    this.eventId,
    this.organizerId,
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.address,
    this.variation,
    this.price,
    this.quantity,
    this.discount,
    this.tax,
    this.commission,
    this.earlyBirdDiscount,
    this.currencyText,
    this.currencyTextPosition,
    this.currencySymbol,
    this.currencySymbolPosition,
    this.paymentMethod,
    this.gatewayType,
    this.paymentStatus,
    this.invoice,
    this.attachmentFile,
    this.eventDate,
    this.createdAt,
    this.updatedAt,
    this.taxPercentage,
    this.commissionPercentage,
    this.scanStatus,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        id: json["id"],
        customerId: json["customer_id"],
        bookingId: json["booking_id"],
        ticketId: json["ticket_id"],
        eventId: json["event_id"],
        organizerId: json["organizer_id"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zip_code"],
        address: json["address"],
        variation: json["variation"],
        price: json["price"],
        quantity: json["quantity"],
        discount: json["discount"],
        tax: json["tax"],
        commission: json["commission"],
        earlyBirdDiscount: json["early_bird_discount"],
        currencyText: json["currencyText"],
        currencyTextPosition: json["currencyTextPosition"],
        currencySymbol: json["currencySymbol"],
        currencySymbolPosition: json["currencySymbolPosition"],
        paymentMethod: json["paymentMethod"],
        gatewayType: json["gatewayType"],
        paymentStatus: json["paymentStatus"],
        invoice: json["invoice"],
        attachmentFile: json["attachmentFile"],
        eventDate: json["event_date"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        taxPercentage: json["tax_percentage"],
        commissionPercentage: json["commission_percentage"],
        scanStatus: json["scan_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "booking_id": bookingId,
        "ticket_id": ticketId,
        "event_id": eventId,
        "organizer_id": organizerId,
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "country": country,
        "state": state,
        "city": city,
        "zip_code": zipCode,
        "address": address,
        "variation": variation,
        "price": price,
        "quantity": quantity,
        "discount": discount,
        "tax": tax,
        "commission": commission,
        "early_bird_discount": earlyBirdDiscount,
        "currencyText": currencyText,
        "currencyTextPosition": currencyTextPosition,
        "currencySymbol": currencySymbol,
        "currencySymbolPosition": currencySymbolPosition,
        "paymentMethod": paymentMethod,
        "gatewayType": gatewayType,
        "paymentStatus": paymentStatus,
        "invoice": invoice,
        "attachmentFile": attachmentFile,
        "event_date": eventDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tax_percentage": taxPercentage,
        "commission_percentage": commissionPercentage,
        "scan_status": scanStatus,
      };
}
