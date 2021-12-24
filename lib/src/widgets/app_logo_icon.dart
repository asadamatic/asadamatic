import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLogoIcon extends StatelessWidget {
  AppLogoIcon({this.asset, this.index, this.package, Key? key})
      : super(key: key);
  final int? index;
  final String? asset;
  final String? package;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        id: package,
        builder: (_homeController) {
          final isCurrentSelected = index == _homeController.sliderIndex.value;

          return Container(
            padding: EdgeInsets.all(8.0 - _homeController.iconIncreasedHeight),
            child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  _homeController.onPageChanged(index);
                },
                onHover: (value) {
                  if (!isCurrentSelected &&
                      index ==
                          appLogoIcons.indexWhere(
                              (appLogoIcon) => appLogoIcon[1] == package!)) {
                    if (value) {
                      _homeController.onHover(package);
                    } else {
                      _homeController.onHoverRemoved(package);
                    }
                  }
                },
                child: Column(
                  children: [
                    Image(
                      height: _homeController.iconHeight,
                      image: AssetImage(asset ?? 'Assets/icon.png',
                          package: package),
                    ),
                    GetBuilder<ThemeController>(
                      builder: (_themeController) {
                        final darkTheme = _themeController.themeMode == ThemeMode.dark;
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 6.0),
                            width: 20.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                                color: isCurrentSelected ? darkTheme ? Colors.white : Colors.black : null,
                                borderRadius: BorderRadius.circular(10.0)));
                      }
                    )
                  ],
                )),
          );
        });
  }
}
