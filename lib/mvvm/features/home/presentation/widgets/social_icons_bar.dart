import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/core/get/controllers/theme_controller.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/icon_palettes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialIconsBar extends StatelessWidget {
  SocialIconsBar({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final HomeController _homeController = Get.find();
    return Container(
        height: 140.0,
        width: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _themeController.themeMode == ThemeMode.dark
                ? Colors.black87
                : Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: const SocialPalette());
  }
}
