import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageIndicator extends StatelessWidget {
  const HomePageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.0,
      height: 90.0,
      child: GetBuilder<ThemeController>(builder: (_themeController) {
        return GetBuilder<HomeController>(
            id: 'updateHomePageView',
            builder: (_homeController) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [0, 1, 2].map((pageIndex) {
                    final currentPageColor =
                        _homeController.homePageIndex == pageIndex;
                    final color = _themeController.isThemeDark
                        ? Colors.white
                        : Colors.black;
                    return InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () => _homeController.changeHomePage(pageIndex),
                      child: Container(
                        margin: const EdgeInsets.all(6.0),
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: color),
                            borderRadius: BorderRadius.circular(12.0),
                            color: currentPageColor ? color : null),
                      ),
                    );
                  }).toList());
            });
      }),
    );
  }
}
