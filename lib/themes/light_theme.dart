import 'package:event_app/utils/color_resources.dart';
import 'package:flutter/material.dart';

// ThemeData light = ThemeData(
//   scaffoldBackgroundColor: Colors.white,
//   primarySwatch: ColorResources.PRIMARY_MATERIAL,
//   fontFamily: 'Poppins',
//   primaryColor: const Color.fromRGBO(49, 65, 155, 1),
//   brightness: Brightness.light,
//   textSelectionTheme: const TextSelectionThemeData(cursorColor: ColorResources.PRIMARY_MATERIAL),
//   pageTransitionsTheme: const PageTransitionsTheme(builders: {
//     TargetPlatform.android: ZoomPageTransitionsBuilder(),
//     TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
//     TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
//   }),
//   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromRGBO(49, 65, 155, 1)),
// );

ThemeData myTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.grey.shade50,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorResources.PRIMARY_MATERIAL,
    iconTheme: IconThemeData(color: Colors.white, size: 20),
    titleTextStyle: TextStyle(color: Colors.white, fontFamily: 'SourceSans'),
    elevation: 0,
  ),
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(49, 65, 155, 1),
  primarySwatch: ColorResources.PRIMARY_MATERIAL,
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(45),
    ),
  ),
  fontFamily: 'SourceSans',
  iconTheme: IconThemeData(color: ColorResources.GREY, size: 20),
  primaryIconTheme: IconThemeData(color: ColorResources.GREY, size: 20),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.grey[800],
    ),
    labelLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: const Color.fromRGBO(49, 65, 155, 1),
    disabledColor: Colors.grey[400],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF86AE15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: Colors.grey.shade200,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorResources.PRIMARY_MATERIAL),
);
