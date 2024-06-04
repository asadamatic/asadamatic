import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode? themeMode = ThemeMode.system;

  @override
  void onInit() async {
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
