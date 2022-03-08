import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const breakPointSmallMedium = 780;
  static const breakPointMediumLarge = 1050;
  static const deviceViewWidthLarge = 300.0;
  static const mobileHeight = 800.0;
  static const mobileWidth = 400.0;

  static Color shimmerBaseColor = Colors.grey[200]!;
  static Color shimmerHighlightColor = Colors.grey[400]!;
  static const int primaryColorValue = 0xff003d73;
  static const Color primaryColor = Color(primaryColorValue);
  static const Color accentColor = Color(0xff64feda);
  static const MaterialColor? primarySwatch = MaterialColor(primaryColorValue, {
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });
// Color packageNameColor = const Color(0xFF1967d2);

  static ThemeData lightTheme = ThemeData(
      primarySwatch: ChatRoomStyles.primarySwatch,
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: ChatRoomStyles.primarySwatch!));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: ChatRoomStyles.primarySwatch,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ChatRoomStyles.accentColor,
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ChatRoomStyles.accentColor)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ChatRoomStyles.accentColor.withOpacity(.7),
        cursorColor: ChatRoomStyles.accentColor,
        selectionHandleColor: ChatRoomStyles.accentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ChatRoomStyles.accentColor),
              foregroundColor: MaterialStateProperty.all(Colors.black))));
}
