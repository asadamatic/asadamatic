import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/main.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/main.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/main.dart';
import 'package:asadamatic/src/services/network.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? nameAnimationController;
  Rx<bool> isShowingDrawer = false.obs;
  Animation<RelativeRect>? animation, iconButtonAnimation;
  final RxInt osIndex = 0.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final sliderIndex = 0.obs;
  double iconHeight = 30.0;
  double iconIncreasedHeight = 2.5;
  List<Package> packagesData = [];

  bool packagesDataLoaded = false;
  final NetworkService _networkService = NetworkService();

  @override
  void onInit() async {
    super.onInit();
    _networkService.initialize();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(300, 0, -300, 0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    ));
    nameAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        value: 0.002,
        animationBehavior: AnimationBehavior.preserve);
    nameAnimationController!.forward();

    final result = await _networkService.getPackagesData();
    if (result.statusCode == 200) {
      packagesData = [
        Package.fromJson(result.body[0]),
        Package.fromJson(result.body[1]),
        Package.fromJson(result.body[2])
      ];
    } else {
      packagesData = AppConstants.packagesDescription;
    }
    packagesDataLoaded = true;
    update(['updatePackagesData']);
  }

  showDrawer() {
    animationController!.forward();
    nameAnimationController!.reverse();
    isShowingDrawer.value = true;
    update(['drawerUpdate']);
  }

  hideDrawer() {
    animationController!.reverse();
    nameAnimationController!.forward();
    isShowingDrawer.value = false;
    update(['drawerUpdate']);
  }

  osOnHover(bool value, int newIndex) {
    if (value) {
      if (newIndex != osIndex.value) {
        osHover.value = true;
        osHoverIndex.value = newIndex;
      } else {
        osHover.value = false;
      }
    } else {
      osHover.value = false;
    }

    update(['osHoverUpdate', 'osIndexUpdate']);
  }

  onOsChanged(newIndex) {
    osIndex.value = newIndex;
    update(['osIndexUpdate']);
  }

  onPageChanged(newIndex) {
    sliderIndex.value = newIndex;
    update(['boltgrocery', 'dailytodo', 'legacyweather', 'sliderIndexUpdate']);
  }

  getSliderApp() {
    return sliderIndex.value == 0
        ? BoltGroceryApp()
        : sliderIndex.value == 1
            ? DailyTodoApp()
            : LegacyWeatherApp();
  }

  onHover(package) {
    iconHeight = 30.0;
    iconIncreasedHeight = 2.5;
    update([package]);
  }

  onHoverRemoved(package) {
    iconHeight = 25.0;
    iconIncreasedHeight = 0.0;
    update([package]);
  }

  copyPackageVersion(String package) {
    FlutterClipboard.copy(package.replaceFirst(" ", ": ^"));
  }

  hireMe() async {
    await launch(AppConstants.linkedInUrl);
  }

  @override
  void dispose() {
    animationController!.dispose();
    nameAnimationController!.dispose();
    super.dispose();
  }
}
