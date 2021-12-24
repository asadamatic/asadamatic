import 'package:boltgrocery/main.dart';
import 'package:dailytodo/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:legacyweather/main.dart';

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

  @override
  void onInit() {
    super.onInit();
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
  }

  showDrawer() {
    animationController!.forward();
    nameAnimationController!.forward();
    isShowingDrawer.value = true;
    update(['drawerUpdate']);
  }

  hideDrawer() {
    animationController!.reverse();
    nameAnimationController!.reverse();
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
  @override
  void dispose() {
    animationController!.dispose();
    nameAnimationController!.dispose();
    super.dispose();
  }
}
