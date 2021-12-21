import 'package:asadamatic/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacyweather/constants/values.dart';
import 'package:legacyweather/controllers/weather_controller.dart';
import 'package:legacyweather/wrapper.dart';

class LegacyWeatherApp extends StatelessWidget {
  final WeatherController _weatherController = Get.put(WeatherController());
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asad Hameed',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        //01286a color
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: MaterialStateProperty.all(primaryColor),
                textStyle:
                    MaterialStateProperty.all(TextStyle(fontSize: 22.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle:
                    MaterialStateProperty.all(TextStyle(fontSize: 22.0)))),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          backgroundColor: primaryColor,
          textTheme: TextTheme(
              headline5:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              headline6: TextStyle(color: Colors.white)),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 22.0)))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  foregroundColor: MaterialStateProperty.all(primaryColor),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 22.0))))),
      themeMode: _themeController.themeMode,
      home: Wrapper(),
    );
  }
}
