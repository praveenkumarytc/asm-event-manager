import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setNotificationBarColor(Color color) {
  Color backgroundColor = color;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: ThemeData.estimateBrightnessForColor(backgroundColor),
  ));
}
