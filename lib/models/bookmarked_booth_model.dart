// To parse this JSON data, do
//
//     final bookmarkedBoothModel = bookmarkedBoothModelFromJson(jsonString);

import 'dart:convert';

import 'package:event_app/models/booth_bookings_model.dart';

BookmarkedBoothModel bookmarkedBoothModelFromJson(String str) => BookmarkedBoothModel.fromJson(json.decode(str));

String bookmarkedBoothModelToJson(BookmarkedBoothModel data) => json.encode(data.toJson());

class BookmarkedBoothModel {
  final String? status;
  final int? code;
  final List<SavedBooth>? savedBooth;

  BookmarkedBoothModel({
    this.status,
    this.code,
    this.savedBooth,
  });

  factory BookmarkedBoothModel.fromJson(Map<String, dynamic> json) => BookmarkedBoothModel(
        status: json["status"],
        code: json["code"],
        savedBooth: json["saved_booth"] == null ? [] : List<SavedBooth>.from(json["saved_booth"]!.map((x) => SavedBooth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "saved_booth": savedBooth == null ? [] : List<dynamic>.from(savedBooth!.map((x) => x.toJson())),
      };
}

class SavedBooth {
  final int? boothId;
  final int? eventId;
  final String? name;
  final String? lastname;
  final String? mobile;
  final String? address;
  final String? eventImage;
  final String? boothLatitude;
  final String? boothLongitude;
  final String? boothHeight;
  final String? boothWidth;
  final String? boothName;
  final String? internalNote;
  final String? externalNote;
  final String? promotionalProduct;
  final String? productDetails;
  final String? title;
  final List<Product>? products;

  SavedBooth({
    this.eventId,
    this.boothId,
    this.name,
    this.lastname,
    this.mobile,
    this.address,
    this.boothLatitude,
    this.boothLongitude,
    this.boothHeight,
    this.boothWidth,
    this.boothName,
    this.internalNote,
    this.externalNote,
    this.promotionalProduct,
    this.productDetails,
    this.title,
    this.products,
    this.eventImage,
  });

  factory SavedBooth.fromJson(Map<String, dynamic> json) => SavedBooth(
        boothId: json["booth_id"],
        eventId: json["event_id"],
        name: json["name"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        eventImage: json["hero_iamge"],
        address: json["address"],
        boothLatitude: json["booth_latitude"],
        boothLongitude: json["booth_longitude"],
        boothHeight: json["booth_height"],
        boothWidth: json["booth_width"],
        boothName: json["booth_name"],
        internalNote: json["internal_note"],
        externalNote: json["external_note"],
        promotionalProduct: json["promotional_product"],
        productDetails: json["product_details"],
        title: json["event_title"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "booth_id": boothId,
        "name": name,
        "lastname": lastname,
        "mobile": mobile,
        "address": address,
        "booth_latitude": boothLatitude,
        "booth_longitude": boothLongitude,
        "booth_height": boothHeight,
        "booth_width": boothWidth,
        "booth_name": boothName,
        "internal_note": internalNote,
        "external_note": externalNote,
        "hero_iamge": eventImage,
        "promotional_product": promotionalProduct,
        "product_details": productDetails,
        "event_title": title,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
