// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'fcm_model.dart';

// class NotificationServices {
//   //initialising firebase message plugin
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   //initialising firebase message plugin
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   //function to initialise flutter local notification plugin to show notifications for android when app is active
//   void initLocalNotifications(BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings = const AndroidInitializationSettings('ic_notification');
//     var iosInitializationSettings = const DarwinInitializationSettings();

//     var initializationSetting = InitializationSettings(android: androidInitializationSettings, iOS: iosInitializationSettings);

//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSetting,
//       onDidReceiveNotificationResponse: (payload) {
//         // handle interaction when app is active for android
//         handleMessage(context, message);
//       },
//     );
//   }

//   void firebaseInit(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;

//       if (kDebugMode) {
//         print('data:${message.data.toString()}');
//       }

//       if (Platform.isIOS) {
//         forgroundMessage();
//       }

//       if (Platform.isAndroid) {
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }
//     });
//   }

//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('user granted permission');
//       }
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('user granted provisional permission');
//       }
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       if (kDebugMode) {
//         print('user denied permission');
//       }
//     }
//   }

//   // function to show visible notification when app is active
//   Future<void> showNotification(RemoteMessage message) async {
//     FcmModel? fcmModel = FcmModel.fromJson(message.data);
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       AppConstants.APP_NAME,
//       'Notifications',
//       importance: Importance.max,
//       showBadge: true,
//       playSound: true,
//       enableVibration: true,
//       enableLights: true,
//       ledColor: Colors.white,
//     );

//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       color: ColorResources.PRIMARY_MATERIAL,
//       playSound: true,
//       priority: Priority.high,
//       importance: Importance.max,
//       setAsGroupSummary: true,
//       styleInformation: const DefaultStyleInformation(true, true),
//       channelShowBadge: true,
//       visibility: NotificationVisibility.public, // Set visibility to public to show on the lock screen
//       autoCancel: false,
//       enableVibration: true,

//       enableLights: true,
//       ledColor: Colors.white,
//       ledOnMs: 1000,
//       // largeIcon: const DrawableResourceAndroidBitmap('ic_notification'),
//       icon: 'ic_notification',
//       ledOffMs: 500,
//     );

//     const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);

//     NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);

//     print(fcmModel.toJson().toString());
//     if (fcmModel.pushType == 'chat_page') {
//       String? currentChatId = Provider.of<AuthProviderSDK>(Get.context!, listen: false).currentChatGroupId;
//       if (currentChatId != fcmModel.chatId) {
//         Future.delayed(Duration.zero, () {
//           _flutterLocalNotificationsPlugin.show(
//             0,
//             fcmModel.subject ?? 'dwd',
//             fcmModel.message ?? 'dwdw',
//             notificationDetails,
//           );
//         });
//       }
//     } else {
//       Future.delayed(Duration.zero, () {
//         _flutterLocalNotificationsPlugin.show(
//           0,
//           fcmModel.subject,
//           fcmModel.message,
//           notificationDetails,
//         );
//       });
//     }
//   }

//   //function to get device token on which we will send the notifications
//   Future<String?> getDeviceToken() async {
//     String? fcmtoken = await messaging.getToken();
//     log('fcmtoken  $fcmtoken');
//     return fcmtoken;
//   }

//   void isTokenRefresh() async {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//       if (kDebugMode) {
//         print('refresh');
//       }
//     });
//   }

//   //handle tap on notification when app is in background or terminated
//   Future<void> setupInteractMessage() async {
//     // when app is terminated
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

//     if (initialMessage != null) {
//       handleMessage(navigatorKey.currentContext!, initialMessage);
//     }

//     //when app ins background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessage(navigatorKey.currentContext!, event);
//     });
//   }

//   void handleMessage(BuildContext context, RemoteMessage message) {
//     FcmModel notificationData = FcmModel.fromJson(jsonDecode(jsonEncode(message.data)));

//     if (notificationData.screenPage == 'chat_message') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ChatPage(
//             userDocType: isAgentApp ? FirebaseUserDocType.buyerAgent : FirebaseUserDocType.buyer,
//             arguments: ChatPageArguments(
//               peerId: notificationData.id ?? '',
//               peerAvatar: '',
//               peerNickname: notificationData.subject ?? '',
//             ),
//           ),
//         ),
//       );
//     } else if (notificationData.idType == 'return_id') {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => ReturnOrderDetailPage(
//       //       returnId: notificationData.id,
//       //       fromOrderListScreen: false,
//       //     ),
//       //   ),
//       // );
//     } else if (notificationData.idType == 'product_id') {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => ProductDetailScreen(inventoryId: notificationData.id, productName: '', shopId: ''),
//       //   ),
//       // );
//     }

//     _flutterLocalNotificationsPlugin.cancelAll();
//   }

//   Future forgroundMessage() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
// }

// class ShowDeliveredStatus extends StatelessWidget {
//   const ShowDeliveredStatus({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Padding(
//         padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Divider(thickness: .1, color: ColorResources.COLOR_PRIMARY),
//             const SizedBox(
//               height: 10,
//             ),
//             // Image.asset(Images.not_for_delivery),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Your Odered Delivered Successfully!',
//                     style: GoogleFonts.raleway(),
//                     maxLines: 2,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(thickness: .1, color: ColorResources.COLOR_PRIMARY),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const DashBoardScreen()));
//                     },
//                     child: Text('OK', style: GoogleFonts.raleway()))
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// //   Future<BitmapDrawableAndroidBitmap> _downloadAndCreateBitmap(String imageUrl) async {
// //   final ByteData data = await rootBundle.load(imageUrl);
// //   final Uint8List bytes = data.buffer.asUint8List();
// //   final ui.Codec codec = await ui.instantiateImageCodec(bytes);
// //   final ui.FrameInfo frameInfo = await codec.getNextFrame();
// //   final ui.Image image = frameInfo.image;

// //   return BitmapDrawableAndroidBitmap.fromBytes(Uint8List.view(image.toByteData(format: ui.ImageByteFormat.png).buffer));
// // }
// }
