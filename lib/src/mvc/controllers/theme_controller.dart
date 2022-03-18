import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode? themeMode = ThemeMode.system;
  Brightness brightness = SchedulerBinding.instance!.window.platformBrightness;
  @override
  void onInit() async {
    themeMode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    super.onInit();
  }

  bool get isThemeDark => themeMode == ThemeMode.dark;

  toggleTheme() {
    if (themeMode == ThemeMode.light) {
      Get.changeThemeMode(ThemeMode.dark);
      themeMode = ThemeMode.dark;
    } else {
      Get.changeThemeMode(ThemeMode.light);
      themeMode = ThemeMode.light;
    }
    update();
  }
}
