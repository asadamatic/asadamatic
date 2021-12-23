import 'package:asadamatic/src/mvc/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;
  Rx<bool> isShowingDrawer = false.obs;
  Animation<RelativeRect>? animation, iconButtonAnimation;

  final InfoDrawerController _drawerController =
      Get.put(InfoDrawerController());
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
  }

  showDrawer() {
    animationController!.forward();
    _drawerController.animationController!.reverse();
    isShowingDrawer.value = true;
    update();
  }

  hideDrawer() {
    animationController!.reverse();
    _drawerController.animationController!.forward();
    isShowingDrawer.value = false;
    update();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
