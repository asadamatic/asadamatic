import 'dart:async';

import 'package:asadamatic/src/enums.dart';
import 'package:asadamatic/src/mvc/models/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String packageInfoBuilder = 'packageInfo';
const String osBuilder = 'osIndexUpdate';
const String bioBuilder = 'updateBio';
const String appsBuilder = 'apps';
const String appScreenshotsBuilder = 'sliderIndexUpdate';
class HomeController extends GetxController with GetTickerProviderStateMixin {
  final Rx<Os> selectedOs = Os.ios.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final Rx<App> selectedApp = apps.first.obs;
  int homePageIndex = 0;
  PageController appsPageController = PageController(initialPage: 0);

    PackageInfo? packageInfo;
  @override
  void onInit() async {
    super.onInit();
    packageInfo = await PackageInfo.fromPlatform();

    update([packageInfoBuilder]);

    Timer.periodic(const Duration(seconds: 2), (timer) {
      bioPlatformIndex = (bioPlatformIndex + 1) % Platforms.values.length;
      update([bioBuilder]);
    });
  }

  int bioPlatformIndex = 0;
   onOsChanged(Os os) {
    selectedOs.value = os;
    update([osBuilder]);
  }

  onChangedApp(index) {
    selectedApp.value = apps.elementAt(index);
    update([appsBuilder, appScreenshotsBuilder]);
  }

  moveAppsForwards() => appsPageController.nextPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  moveAppsBackwards() => appsPageController.previousPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
}
