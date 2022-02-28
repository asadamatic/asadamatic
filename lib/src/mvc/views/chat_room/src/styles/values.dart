import 'package:flutter/material.dart';

class ChatRoomStyles {
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

  static const double actionSize = 28.0;
  static const double actionIconSize = 24.0;
  static const double chatRoomHeightMax = 657.0;
  static const double chatRoomWidthMax = 360.0;
  static const double chatRoomHeightMin = 450.0;
  static const double chatRoomWidthMin = 360.0;
  static const double chatRoomHeightClosed = 0.0;
  static const double chatRoomWidthClosed = 0.0;
  static const double buttonWidth = 200.0;
  static const double buttonHeight = 50.0;

  static BorderRadius get buttonRadius => BorderRadius.circular(100.0);

  static ThemeData lightTheme = ThemeData(
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      primarySwatch: ChatRoomStyles.primarySwatch,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ChatRoomStyles.primarySwatch!,
          accentColor: ChatRoomStyles.accentColor));

  static ThemeData darkTheme = ThemeData(
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      primarySwatch: ChatRoomStyles.primarySwatch,
      buttonTheme: const ButtonThemeData(buttonColor: Colors.black),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ChatRoomStyles.accentColor,
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ChatRoomStyles.accentColor)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ChatRoomStyles.accentColor.withOpacity(.4),
        cursorColor: ChatRoomStyles.accentColor,
        selectionHandleColor: ChatRoomStyles.accentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ChatRoomStyles.accentColor),
              foregroundColor: MaterialStateProperty.all(Colors.black))));
}
