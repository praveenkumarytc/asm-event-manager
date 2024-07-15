// To parse this JSON data, do
//
//     final allBoothListModel = allBoothListModelFromJson(jsonString);

import 'dart:convert';

AllBoothListModel allBoothListModelFromJson(String str) => AllBoothListModel.fromJson(json.decode(str));

String allBoothListModelToJson(AllBoothListModel data) => json.encode(data.toJson());

class AllBoothListModel {
  final String? status;
  final int? code;
  final List<Booth>? booths;

  AllBoothListModel({
    this.status,
    this.code,
    this.booths,
  });

  factory AllBoothListModel.fromJson(Map<String, dynamic> json) => AllBoothListModel(
        status: json["status"],
        code: json["code"],
        booths: json["booths"] == null ? [] : List<Booth>.from(json["booths"]!.map((x) => Booth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "booths": booths == null ? [] : List<dynamic>.from(booths!.map((x) => x.toJson())),
      };
}

class Booth {
  final int? boothId;
  final String? name;
  final String? lastname;
  final String? mobile;
  final String? address;
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
  final String? status;

  Booth({
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
    this.status,
  });

  factory Booth.fromJson(Map<String, dynamic> json) => Booth(
        boothId: json["booth_id"],
        name: json["name"],
        lastname: json["lastname"],
        mobile: json["mobile"],
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
        title: json["title"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
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
        "promotional_product": promotionalProduct,
        "product_details": productDetails,
        "title": title,
        "status": status,
      };
}
