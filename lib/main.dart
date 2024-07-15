import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './di_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

AndroidNotificationChannel? channel;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
//   debugPrint("Handling a background message: ${message.data}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   FirebaseMessaging.instance.requestPermission(alert: true, announcement: true, badge: true, carPlay: true, criticalAlert: true, provisional: true, sound: true);
  // }

  // try {
  //   if (!kIsWeb) {
  //     channel = const AndroidNotificationChannel(
  //       'high_importance_channel',
  //       'High Importance Notifications',
  //       importance: Importance.max,
  //     );

  //     if (defaultTargetPlatform == TargetPlatform.android) {
  //       FirebaseMessaging.instance.requestPermission();
  //     }
  //   }

  //   /*  final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  //   if (remoteMessage != null) {
  //     orderID = remoteMessage.notification!.titleLocKey != null ? int.parse(remoteMessage.notification!.titleLocKey!) : null;
  //   }*/

  //   await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  //   // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // } catch (e) {
  //   if (kDebugMode) {
  //     print('error----> ${e.toString()}');
  //   }
  // }

  di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (context) => di.sl<HomeProvider>()),
        ChangeNotifierProvider<AuthProvider>(create: (context) => di.sl<AuthProvider>()),
      ],
      child: const EventApp(),
    ),
  );
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'ASM Events',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const Splashpage(),
    );
  }
}
