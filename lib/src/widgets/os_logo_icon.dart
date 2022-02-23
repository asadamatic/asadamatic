import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OsLogoIcon extends StatelessWidget {
  OsLogoIcon({this.asset, Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();
  final String? asset;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Image(
        color: _themeController.themeMode == ThemeMode.dark
            ? asset == 'assets/apple.png'
                ? Colors.white
                : null
            : null,
        image: AssetImage(asset ?? 'assets/android.png'),
      ),
    );
  }
}
