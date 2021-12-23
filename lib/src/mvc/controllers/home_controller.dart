import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? nameAnimationController;
  Rx<bool> isShowingDrawer = false.obs;
  Animation<RelativeRect>? animation, iconButtonAnimation;

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
        animationBehavior: AnimationBehavior.preserve);
    nameAnimationController!.forward();
  }

  showDrawer() {
    animationController!.forward();
    nameAnimationController!.reverse();
    isShowingDrawer.value = true;
    update();
  }

  hideDrawer() {
    animationController!.reverse();
    nameAnimationController!.forward();
    isShowingDrawer.value = false;
    update();
  }


  @override
  void dispose() {
    animationController!.dispose();
    nameAnimationController!.dispose();
    super.dispose();
  }
}
