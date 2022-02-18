import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoltGroceryApp extends StatelessWidget {
  final ThemeController _themeController = Get.find();

  BoltGroceryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeController.themeMode,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: AppConstants.appTitle,
      theme: ThemeData(
          primaryColor: Colors.green[400],
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.green[400],
            cursorColor: Colors.green[400],
            selectionHandleColor: Colors.green[400],
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            color: Colors.green[400],
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              headline6: TextStyle(
                color: Colors.black,
                letterSpacing: 0.8,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              subtitle2: TextStyle(
                color: Colors.black,
                letterSpacing: 0.8,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              )),
          bottomAppBarColor: Colors.green[400],
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent)),
      darkTheme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.green[400],
          cursorColor: Colors.green[400],
          selectionHandleColor: Colors.green[400],
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              letterSpacing: 0.8,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
            subtitle2: TextStyle(
              color: Colors.white,
              letterSpacing: 0.8,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            )),
        bottomAppBarColor: Colors.grey[900],
      ),
      home: const Wrapper(),
    );
  }
}
