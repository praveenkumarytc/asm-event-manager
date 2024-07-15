import 'package:flutter/material.dart';

class ColorResources {
  static const Color BLACK = Color(0xff000000);
  static const Color WHITE = Color(0xffFFFFFF);
  static const Color COLOR_PRIMARY = Color(0xff1B7FED);
  static const Color COLOR_BLUE = Color(0xff00ADE3);
  static const Color COLOR_BLUE_PRIMARY = Color(0xFF00BAFF);
  static const Color COLOR_YELLOW_DELEGATE = Color.fromARGB(255, 243, 201, 49);

  static const Color COLUMBIA_BLUE = Color(0xff00ADE3);
  static const Color LIGHT_SKY_BLUE = Color(0xff8DBFF6);
  static const Color HARLEQUIN = Color(0xff3FCC01);
  static const Color CERISE = Color(0xffE2206B);
  static Color GREY = const Color.fromRGBO(157, 157, 157, 1);
  static const Color RED = Color(0xFFD32F2F);
  static const Color DARK_BLUE = Color.fromRGBO(11, 71, 149, 1);
  static const Color GOLDEN_BROWN = Color.fromRGBO(153, 84, 20, 1);
  static const Color PRIMARY_BUTTON_COLOR = Color.fromRGBO(8, 204, 155, 1);
  static const Color HINT_TEXT_COLOR = Color(0xff9E9E9E);
  static const Color GAINS_BORO = Color(0xffE6E6E6);
  static const Color agent_light_brown = Color.fromRGBO(255, 235, 218, 1);
  static const Color TEXT_BG = Color(0xffF3F9FF);
  static const Color GOLDEN = Color.fromRGBO(177, 151, 66, 1);
  static const Color ICON_BG = Color(0xffF9F9F9);
  static const Color HOME_BG = Color(0xffF0F0F0);
  static const Color IMAGE_BG = Color(0xffE2F0FF);
  static const Color SELLER_TXT = Color(0xff92C6FF);
  static const Color CHAT_ICON_COLOR = Color(0xffD4D4D4);
  static const Color LOW_GREEN = Color(0xffEFF6FE);
  static const Color GREEN = Color(0xFF86AE15);
  static const Color FLOATING_BTN = Color(0xff7DB6F5);
  static const Color RATING_COLOR = Color(0xFFFFA534);

  static const MaterialColor PRIMARY_MATERIAL_AGENT = MaterialColor(0xFFFF7500, colorMapAgent);
  static const Map<int, Color> colorMapAgent = {
    50: Color.fromRGBO(255, 117, 0, 0.1),
    100: Color.fromRGBO(255, 117, 0, 0.2),
    200: Color.fromRGBO(255, 117, 0, 0.3),
    300: Color.fromRGBO(255, 117, 0, 0.4),
    400: Color.fromRGBO(255, 117, 0, 0.5),
    500: Color.fromRGBO(255, 117, 0, 0.6),
    600: Color.fromRGBO(255, 117, 0, 0.7),
    700: Color.fromRGBO(255, 117, 0, 0.8),
    800: Color.fromRGBO(255, 117, 0, 0.9),
    900: Color.fromRGBO(255, 117, 0, 1),
  };

  static const Map<int, Color> colorMapBuyer = {
    50: Color.fromRGBO(4, 81, 139, 0.1),
    100: Color.fromRGBO(4, 81, 139, 0.2),
    200: Color.fromRGBO(4, 81, 139, 0.3),
    300: Color.fromRGBO(4, 81, 139, 0.4),
    400: Color.fromRGBO(4, 81, 139, 0.5),
    500: Color.fromRGBO(4, 81, 139, 0.6),
    600: Color.fromRGBO(4, 81, 139, 0.7),
    700: Color.fromRGBO(4, 81, 139, 0.8),
    800: Color.fromRGBO(4, 81, 139, 0.9),
    900: Color.fromRGBO(4, 81, 139, 1),
  };

  static const MaterialColor PRIMARY_MATERIAL = MaterialColor(0xFF04518B, colorMapBuyer);
}
