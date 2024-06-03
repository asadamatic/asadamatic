import 'dart:async';

import 'package:asadamatic/src/enums.dart';
import 'package:asadamatic/src/mvc/models/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final Rx<Os> selectedOs = Os.ios.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final Rx<App> selectedApp = apps.first.obs;
  int homePageIndex = 0;
  PageController appsPageController = PageController(initialPage: 0);

  late final PackageInfo packageInfo;
  @override
  void onInit() async {
    super.onInit();

    packageInfo = await PackageInfo.fromPlatform();
    update(['packageInfo']);

    Timer.periodic(const Duration(seconds: 2), (timer) {
      bioPlatformIndex = (bioPlatformIndex + 1) % Platforms.values.length;
      update(['updateBio']);
    });
  }

  int bioPlatformIndex = 0;
  showDrawer() {
    update(['drawerUpdate']);
  }

  hideDrawer() {
    update(['drawerUpdate']);
  }

  onOsChanged(Os os) {
    selectedOs.value = os;
    update(['osIndexUpdate']);
  }

  onChangedApp(index) {
    selectedApp.value = apps.elementAt(index);
    update(['apps', 'sliderIndexUpdate']);
  }

  onHomePageChanged(int newIndex) {
    homePageIndex = newIndex;
    update(['updateHomePageView']);
  }

  moveAppsForwards() => appsPageController.nextPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  moveAppsBackwards() => appsPageController.previousPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
}
