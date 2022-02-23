import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerToggle extends StatelessWidget {
  const DrawerToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    final ThemeController _themeController = Get.find();
    return PositionedTransition(
        rect: RelativeRectTween(
          begin: RelativeRect.fromLTRB(
              0,
              MediaQuery.of(context).size.height / 2 - 35.0,
              MediaQuery.of(context).size.width - 35,
              MediaQuery.of(context).size.height / 2 - 35.0),
          end: RelativeRect.fromLTRB(
              300,
              MediaQuery.of(context).size.height / 2 - 35.0,
              MediaQuery.of(context).size.width - 335,
              MediaQuery.of(context).size.height / 2 - 35.0),
        ).animate(CurvedAnimation(
            parent: _homeController.animationController!,
            curve: Curves.easeIn)),
        child: Container(
          height: 35.0,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              color: _themeController.themeMode == ThemeMode.dark
                  ? Colors.black87
                  : Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35.0),
                  topRight: Radius.circular(35.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5)
                .animate(_homeController.animationController!),
            child: GetBuilder<HomeController>(
                id: 'drawerUpdate',
                builder: (_homeController) {
                  return IconButton(
                    onPressed: _homeController.isShowingDrawer.value
                        ? _homeController.hideDrawer
                        : _homeController.showDrawer,
                    icon: const Icon(Icons.navigate_next_outlined),
                  );
                }),
          ),
        ));
  }
}
