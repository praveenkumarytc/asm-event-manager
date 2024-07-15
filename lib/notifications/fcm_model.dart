// To parse this JSON data, do
//
//     final fcmModel = fcmModelFromJson(jsonString);

import 'dart:convert';

FcmModel fcmModelFromJson(String str) => FcmModel.fromJson(json.decode(str));

String fcmModelToJson(FcmModel data) => json.encode(data.toJson());

class FcmModel {
  String? pushType;
  String? image;
  String? subject;
  String? idType;
  String? id;
  String? message;
  String? screenPage;
  String? chatId;
  String? senderId;
  String? receiverId;
  String? senderMessage;

  FcmModel({
    this.pushType,
    this.image,
    this.subject,
    this.idType,
    this.id,
    this.message,
    this.screenPage,
    this.chatId,
    this.senderId,
    this.receiverId,
    this.senderMessage,
  });

  factory FcmModel.fromJson(Map<String, dynamic> json) => FcmModel(
        pushType: json["push_type"],
        image: json["image"],
        subject: json["subject"],
        idType: json["id_type"],
        id: json["id"],
        message: json["message"],
        screenPage: json["screen_page"],
        chatId: json['chat_group_id'],
        senderId: json['sender_id'],
        receiverId: json['receiver_id'],
        senderMessage: json["sender_message"],
      );

  Map<String, dynamic> toJson() => {
        "push_type": pushType,
        "image": image,
        "subject": subject,
        "id_type": idType,
        "id": id,
        "sender_id": senderId,
        "sender_message": senderMessage,
        "receiver_id": receiverId,
        "message": message,
        "screen_page": screenPage,
        "chat_group_id": chatId,
      };
}
