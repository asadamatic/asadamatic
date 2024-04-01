import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyTodoApp extends StatelessWidget {
  final ThemeController _themeController = Get.find();

  DailyTodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      themeMode: _themeController.themeMode,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Theme.of(context).primaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(4.0),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0)))),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blue[400], brightness: Brightness.light),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.blue[400],
          selectionHandleColor: Colors.blue[400],
        ), bottomAppBarTheme: BottomAppBarTheme(color: Theme.of(context).primaryColor),
      ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Colors.grey[900],
            foregroundColor: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.grey[700]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[700]!),
                      borderRadius: BorderRadius.circular(8.0))))),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey[900],
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.blue[400], brightness: Brightness.dark),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.blue[400],
            selectionHandleColor: Colors.blue[400],
          ),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.grey[700])),
      home: const Wrapper(),
    );
  }
}
