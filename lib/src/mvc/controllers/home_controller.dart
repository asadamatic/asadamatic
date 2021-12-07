import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  Rx<bool> isShowingDrawer = false.obs;
  Animation<RelativeRect>? animation, iconButtonAnimation;
  @override
  void onInit() {
    super.onInit();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 0, 0),
      end: RelativeRect.fromLTRB(300, 0, -300, 0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    ));
  //   iconButtonAnimation = RelativeRectTween(
  //     begin: RelativeRect.fromLTRB(0, 0, MediaQuery.of(context).size.width - 15, MediaQuery.of(context).size.height - 15),
  //     end: RelativeRect.fromLTRB(300, 0, -300, 0),
  //   ).animate(
  //       CurvedAnimation(parent: animationController!, curve: Curves.easeIn));
  }

  showDrawer() {
    animationController!.forward();
    isShowingDrawer.value = true;
    update();
  }

  hideDrawer() {
    animationController!.reverse();
    isShowingDrawer.value = false;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
