// To parse this JSON data, do
//
//     final eventTicketsModel = eventTicketsModelFromJson(jsonString);

import 'dart:convert';

EventTicketsModel eventTicketsModelFromJson(String str) => EventTicketsModel.fromJson(json.decode(str));

String eventTicketsModelToJson(EventTicketsModel data) => json.encode(data.toJson());

class EventTicketsModel {
  final int? code;
  final String? status;
  final Ticket? ticket;

  EventTicketsModel({
    this.code,
    this.status,
    this.ticket,
  });

  factory EventTicketsModel.fromJson(Map<String, dynamic> json) => EventTicketsModel(
        code: json["code"],
        status: json["status"],
        ticket: json["ticket"] == null ? null : Ticket.fromJson(json["ticket"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "ticket": ticket?.toJson(),
      };
}

class Ticket {
  final int? id;
  final int? eventId;
  final String? eventType;
  final dynamic title;
  final String? ticketAvailableType;
  final int? ticketAvailable;
  final String? maxTicketBuyType;
  final dynamic maxBuyTicket;
  final dynamic description;
  final String? pricingType;
  final String? price;
  final String? delegationPrice;
  final int? fPrice;
  final String? earlyBirdDiscount;
  final dynamic earlyBirdDiscountAmount;
  final String? earlyBirdDiscountType;
  final dynamic earlyBirdDiscountDate;
  final dynamic earlyBirdDiscountTime;
  final dynamic variations;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<PassBenefit>? passBenefit;

  Ticket({
    this.id,
    this.eventId,
    this.eventType,
    this.title,
    this.ticketAvailableType,
    this.ticketAvailable,
    this.maxTicketBuyType,
    this.maxBuyTicket,
    this.description,
    this.pricingType,
    this.price,
    this.delegationPrice,
    this.fPrice,
    this.earlyBirdDiscount,
    this.earlyBirdDiscountAmount,
    this.earlyBirdDiscountType,
    this.earlyBirdDiscountDate,
    this.earlyBirdDiscountTime,
    this.variations,
    this.createdAt,
    this.updatedAt,
    this.passBenefit,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        eventId: json["event_id"],
        eventType: json["event_type"],
        title: json["title"],
        ticketAvailableType: json["ticket_available_type"],
        ticketAvailable: json["ticket_available"],
        maxTicketBuyType: json["max_ticket_buy_type"],
        maxBuyTicket: json["max_buy_ticket"],
        description: json["description"],
        pricingType: json["pricing_type"],
        price: json["price"],
        delegationPrice: json["delegation_price"],
        fPrice: json["f_price"],
        earlyBirdDiscount: json["early_bird_discount"],
        earlyBirdDiscountAmount: json["early_bird_discount_amount"],
        earlyBirdDiscountType: json["early_bird_discount_type"],
        earlyBirdDiscountDate: json["early_bird_discount_date"],
        earlyBirdDiscountTime: json["early_bird_discount_time"],
        variations: json["variations"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        passBenefit: json["pass_benefit"] == null ? [] : List<PassBenefit>.from(json["pass_benefit"]!.map((x) => PassBenefit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "event_type": eventType,
        "title": title,
        "ticket_available_type": ticketAvailableType,
        "ticket_available": ticketAvailable,
        "max_ticket_buy_type": maxTicketBuyType,
        "max_buy_ticket": maxBuyTicket,
        "description": description,
        "pricing_type": pricingType,
        "price": price,
        "delegation_price": delegationPrice,
        "f_price": fPrice,
        "early_bird_discount": earlyBirdDiscount,
        "early_bird_discount_amount": earlyBirdDiscountAmount,
        "early_bird_discount_type": earlyBirdDiscountType,
        "early_bird_discount_date": earlyBirdDiscountDate,
        "early_bird_discount_time": earlyBirdDiscountTime,
        "variations": variations,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pass_benefit": passBenefit == null ? [] : List<dynamic>.from(passBenefit!.map((x) => x.toJson())),
      };
}

class PassBenefit {
  final String? title;
  final int? active;

  PassBenefit({
    this.title,
    this.active,
  });

  factory PassBenefit.fromJson(Map<String, dynamic> json) => PassBenefit(
        title: json["title"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "active": active,
      };
}
