import 'dart:developer';
import 'package:event_app/helper/network_info.dart';
import 'package:event_app/provider/auth_provider.dart';
import 'package:event_app/models/common_model.dart';
import 'package:event_app/ui/auth/login_page.dart';
import 'package:event_app/ui/dash_board.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  void routes() async {
    NetworkInfo.checkConnectivity(context);
    // Provider.of<NotificationProvider>(context, listen: false).initializeLocalNotifications();
    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (!mounted) {
          return;
        }
        String? connectionId, authCode;

        connectionId = Provider.of<AuthProvider>(context, listen: false).getConnectionId();
        authCode = Provider.of<AuthProvider>(context, listen: false).getAuthCode();

        log('$connectionId\n$authCode ');

        if (connectionId == null) {
          CommonModel? connectionModel = await Provider.of<AuthProvider>(context, listen: false).fetchConnectionId(context).then((value) => value);
          connectionId = connectionModel?.connectionId;
        }

        if (connectionId != null && authCode != null && authCode != 'null') {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
          return;
        }

        if (connectionId != null || authCode == null) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    routes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Image.asset(
      Images.splashScreen,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
