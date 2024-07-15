import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_app/main.dart';
import 'package:event_app/notifications/fcm_model.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class NotificationHelper {
  static Future<void> initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        if (notificationResponse.payload != null) {
          try {
            handleMessage(notificationResponse.payload!);
          } catch (e) {
            debugPrint('Error while handling messages : ${e.toString()}');
          }
        }
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Notification data : ${message.data}');
      }
      showNotification(message, flutterLocalNotificationsPlugin, kIsWeb);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("onOpenApp: ${message.data['subject']}/${message.data['body']}/${message.notification?.titleLocKey}");
      }
      // handleMessage(message);
      showNotification(message, flutterLocalNotificationsPlugin, kIsWeb);
    });
  }

  static Future<void> showNotification(RemoteMessage message, FlutterLocalNotificationsPlugin fln, bool data) async {
    FcmModel notification = FcmModel.fromJson(message.data);
    /*
    if (Platform.isAndroid) {
      title = notification.subject;
      body = notification.message;
      orderID = notification.id;
      image = (notification.image != null && notification.image!.isNotEmpty)
          ? message.data['image'].startsWith('http')
              ? message.data['image']
              : '${AppConstants.IMAGE_BASE_URL}/${message.data['image']}'
          : null;
    }
       else {
      title = message.notification!.title;
      body = message.notification!.body;
      orderID = message.notification!.titleLocKey;
      if (Platform.isAndroid) {
        image = (message.notification!.android!.imageUrl != null && message.notification!.android!.imageUrl!.isNotEmpty)
            ? message.notification!.android!.imageUrl!.startsWith('http')
                ? message.notification!.android!.imageUrl
                : '${AppConstants.IMAGE_BASE_URL}/${message.notification!.android!.imageUrl}'
            : null;
      } else if (Platform.isIOS) {
        image = (message.notification!.apple!.imageUrl != null && message.notification!.apple!.imageUrl!.isNotEmpty)
            ? message.notification!.apple!.imageUrl!.startsWith('http')
                ? message.notification!.apple!.imageUrl
                : '${AppConstants.IMAGE_BASE_URL}/${message.notification!.apple!.imageUrl}'
            : null;
      }
    }
    type = notification.pushType;

    Map<String, String> payloadData = {
      "push_type": "${notification.pushType}",
      "subject": "${notification.subject}",
      "id_type": "${notification.idType}",
      "id": "${notification.id}",
      "image": "${notification.image}",
      "message": "${notification.message}",
      "screen_page": "${notification.screenPage}",
      "chat_group_id": "${notification.chatId}",
      "sender_id": "${notification.senderId}",
      "receiver_id": "${notification.receiverId}",
    };
    */

    /*  if (kIsWeb) {
      showDialog(
          context: Get.context!,
          builder: (context) => Center(
                child: NotificationDialogWeb(
                  orderId: int.tryParse(orderID!),
                  title: title,
                  body: body,
                  image: image,
                  type: type,
                ),
              ));
    }
     else */

    final authCode = Provider.of<AuthProvider>(navigatorKey.currentState!.context, listen: false).getAuthCode();

    if (notification.senderId == authCode) {
      notification.subject = notification.senderMessage ?? notification.subject;
    }

    if (notification.image != null && notification.image!.isNotEmpty) {
      try {
        await showBigPictureNotificationHiddenLargeIcon(notification, fln);
      } catch (e) {
        await showBigTextNotification(notification, fln);
      }
    } else {
      await showBigTextNotification(notification, fln);
    }
  }

  static handleMessage(playload) {
    FcmModel notificationData = FcmModel.fromJson(jsonDecode(playload));
    debugPrint('handle message function entered');

    if (notificationData.screenPage == 'chat_message') {
      debugPrint('screen is chat_message');
    } else if (notificationData.idType == 'return_id') {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ReturnOrderDetailPage(
      //       returnId: notificationData.id,
      //       fromOrderListScreen: false,
      //     ),
      //   ),
      // );
    } else if (notificationData.idType == 'product_id') {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProductDetailScreen(inventoryId: notificationData.id, productName: '', shopId: ''),
      //   ),
      // );
    }

    // _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> showBigTextNotification(FcmModel fcmModel, FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      fcmModel.message ?? 'TESTING',
      htmlFormatBigText: true,
      contentTitle: fcmModel.subject ?? '',
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      AppConstants.APP_NAME,
      AppConstants.APP_NAME,
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
      tag: fcmModel.senderId,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(
      0,
      fcmModel.subject,
      fcmModel.message,
      platformChannelSpecifics,
      payload: jsonEncode(fcmModel.toJson()),
    );
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(
    FcmModel fcmModel,
    FlutterLocalNotificationsPlugin fln,
  ) async {
    final String largeIconPath = await _downloadAndSaveFile(fcmModel.image!, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(fcmModel.image!, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: fcmModel.subject,
      htmlFormatContentTitle: true,
      summaryText: fcmModel.message,
      htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      AppConstants.APP_NAME,
      AppConstants.APP_NAME,
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      priority: Priority.max,
      tag: fcmModel.senderId,
      playSound: true,
      styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
      // sound: const RawResourceAndroidNotificationSound('notification'),
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, fcmModel.subject, fcmModel.message, platformChannelSpecifics, payload: jsonEncode(fcmModel.toJson()));
  }

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final Response response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
    final File file = File(filePath);
    await file.writeAsBytes(response.data);
    return filePath;
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("onBackground: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
  }
}
