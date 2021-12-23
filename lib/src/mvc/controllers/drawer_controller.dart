import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDrawerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<RelativeRect>? animation, iconButtonAnimation;
  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        animationBehavior: AnimationBehavior.preserve);
    animationController!.forward();
  }

  showDrawer() {
    animationController!.forward();
    update();
  }

  hideDrawer() {
    animationController!.reverse();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
