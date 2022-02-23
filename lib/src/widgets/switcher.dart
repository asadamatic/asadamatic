import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/widgets/os_logo_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Switcher extends StatelessWidget {
  Switcher({this.direction, Key? key}) : super(key: key);

  final Axis? direction;

  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: direction == Axis.horizontal ? 75.0 : 130.0,
        width: direction == Axis.horizontal ? 130.0 : 75.0,
        decoration: BoxDecoration(
            color: _themeController.themeMode == ThemeMode.dark
                ? Colors.black87
                : Colors.white,
            borderRadius: BorderRadius.circular(55.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: GetBuilder<HomeController>(
            id: 'osIndexUpdate',
            builder: (_homeController) {
              return direction == Axis.horizontal
                  ? Row(
                      children: AppConstants.os
                          .map(
                            (e) => Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _themeController.themeMode ==
                                          ThemeMode.dark
                                      ? Colors.black87
                                      : Colors.white,
                                  boxShadow: _homeController.osIndex.value ==
                                          AppConstants.os.indexOf(e)
                                      ? [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ]
                                      : []),
                              child: InkWell(
                                onTap: () {
                                  _homeController
                                      .onOsChanged(AppConstants.os.indexOf(e));
                                },
                                child: OsLogoIcon(
                                    asset: AppConstants.os.indexOf(e) == 0
                                        ? 'assets/apple.png'
                                        : 'assets/android.png'),
                              ),
                            )),
                          )
                          .toList(),
                    )
                  : Column(
                      children: AppConstants.os
                          .map(
                            (e) => Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              width: 50.0,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _themeController.themeMode ==
                                          ThemeMode.dark
                                      ? Colors.black87
                                      : Colors.white,
                                  boxShadow: _homeController.osIndex.value ==
                                          AppConstants.os.indexOf(e)
                                      ? [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ]
                                      : []),
                              child: InkWell(
                                onTap: () {
                                  _homeController
                                      .onOsChanged(AppConstants.os.indexOf(e));
                                },
                                onHover: (value) {
                                  _homeController.osOnHover(
                                      value, AppConstants.os.indexOf(e));
                                },
                                child: AnimatedScale(
                                  scale: _homeController.osHover.value
                                      ? _homeController.osHoverIndex.value ==
                                              AppConstants.os.indexOf(e)
                                          ? 1.3
                                          : 1.0
                                      : 1.0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                  child: OsLogoIcon(
                                      asset: AppConstants.os.indexOf(e) == 0
                                          ? 'assets/apple.png'
                                          : 'assets/android.png'),
                                ),
                              ),
                            )),
                          )
                          .toList(),
                    );
            }));
  }
}
