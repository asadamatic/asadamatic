import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode? themeMode = ThemeMode.system;
  Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  @override
  void onInit() async {
    themeMode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    super.onInit();
  }

  bool get isThemeDark => themeMode == ThemeMode.dark;

  toggleTheme(ThemeMode mode) {
    if (themeMode != mode) {
      themeMode = mode;
      update();
    }
  }
}
