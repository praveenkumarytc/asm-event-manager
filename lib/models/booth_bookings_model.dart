// To parse this JSON data, do
//
//     final boothBookingsModel = boothBookingsModelFromJson(jsonString);

import 'dart:convert';

BoothBookingsModel boothBookingsModelFromJson(String str) => BoothBookingsModel.fromJson(json.decode(str));

String boothBookingsModelToJson(BoothBookingsModel data) => json.encode(data.toJson());

class BoothBookingsModel {
  final String? status;
  final int? code;
  final List<Booth>? booths;
  final List<ProductCategory>? productCategories;

  BoothBookingsModel({
    this.status,
    this.code,
    this.booths,
    this.productCategories,
  });

  factory BoothBookingsModel.fromJson(Map<String, dynamic> json) => BoothBookingsModel(
        status: json["status"],
        code: json["code"],
        booths: json["booths"] == null ? [] : List<Booth>.from(json["booths"]!.map((x) => Booth.fromJson(x))),
        productCategories: json["product_categories"] == null ? [] : List<ProductCategory>.from(json["product_categories"]!.map((x) => ProductCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "booths": booths == null ? [] : List<dynamic>.from(booths!.map((x) => x.toJson())),
      };
}

class Booth {
  final String? name;
  final String? lastname;
  final String? mobile;
  final String? address;
  final double lat;
  final double lng;
  final double? boothHeight;
  final double? boothWidth;
  final String? boothName;
  final String? internalNote;
  final String? externalNote;
  final String? promotionalProduct;
  final List<Product>? products;
  final String? title;
  final int? id;
  int? bookmakrStatus;

  Booth({
    this.id,
    this.name,
    this.lastname,
    this.mobile,
    this.address,
    required this.lat,
    required this.lng,
    this.boothHeight,
    this.boothWidth,
    this.boothName,
    this.internalNote,
    this.externalNote,
    this.promotionalProduct,
    this.products,
    this.title,
    this.bookmakrStatus,
  });

  factory Booth.fromJson(Map<String, dynamic> json) => Booth(
        id: json["booth_id"],
        name: json["name"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        address: json["address"],
        lat: double.parse(json["booth_latitude"]),
        lng: double.parse(json["booth_longitude"]),
        boothHeight: double.parse(json["booth_height"]) / 10000,
        boothWidth: double.parse(json["booth_width"]) / 10000,
        boothName: json["booth_name"],
        internalNote: json["internal_note"],
        externalNote: json["external_note"],
        promotionalProduct: json["promotional_product"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        title: json["title"],
        bookmakrStatus: json["is_saved"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "booth_id": id,
        "name": name,
        "lastname": lastname,
        "mobile": mobile,
        "address": address,
        "booth_latitude": lat,
        "booth_longitude": lng,
        "booth_height": boothHeight,
        "booth_width": boothWidth,
        "booth_name": boothName,
        "internal_note": internalNote,
        "external_note": externalNote,
        "promotional_product": promotionalProduct,
        "products": products,
        "title": title,
        "is_saved": bookmakrStatus,
      };
}

class Product {
  final String? productName;
  final int? categoryId;
  final String? categoryName;
  final String? description;
  final String? currentPrice;
  final String? productType;
  final String? featureImage;

  Product({
    this.productName,
    this.categoryId,
    this.categoryName,
    this.description,
    this.currentPrice,
    this.productType,
    this.featureImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        description: json["description"],
        currentPrice: json["current_price"],
        productType: json["product_type"],
        featureImage: json["feature_image"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "category_id": categoryId,
        "category_name": categoryName,
        "description": description,
        "current_price": currentPrice,
        "product_type": productType,
        "feature_image": featureImage,
      };
}

class ProductCategory {
  final int? id;
  final String? name;

  ProductCategory({
    this.id,
    this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
