import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/icon_palettes.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

class DeviceView extends StatelessWidget {
  const DeviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:
        (BuildContext layoutBuilderContext, BoxConstraints constraints) {
      final size = MediaQuery.sizeOf(context);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.all(smallSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: responsive_framework.ResponsiveValue<double>(context,
                  defaultValue: 500,
                  conditionalValues: [
                    responsive_framework.Condition.equals(
                        name: responsive_framework.MOBILE, value: 500),
                    responsive_framework.Condition.equals(
                        name: responsive_framework.TABLET, value: 400),
                    responsive_framework.Condition.largerThan(
                        name: responsive_framework.TABLET, value: 600),
                    responsive_framework.Condition.equals(
                        name: responsive_framework.DESKTOP, value: 500),
                  ]).value,
              child: GetBuilder<HomeController>(
                id: 'osIndexUpdate',
                builder: (_homeController) => GetBuilder<HomeController>(
                    id: 'sliderIndexUpdate',
                    builder: (_homeController) {
                      return GetBuilder<ThemeController>(
                          builder: (_themeController) {
                        return DeviceFrame(
                            device: _homeController.selectedOs.value.isIOS
                                ? Devices.ios.iPhoneSE
                                : Devices.android.smallPhone,
                            isFrameVisible: true,
                            screen: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                    child: child, opacity: animation);
                              },
                              child: PageView.builder(
                                  itemCount: _homeController.selectedApp.value
                                      .screenshotAssets.length,
                                  itemBuilder: (context, index) {
                                    final screenshot = _homeController
                                        .selectedApp
                                        .value
                                        .screenshotAssets[index];
                                    return SingleChildScrollView(
                                      child: Image.asset(
                                        screenshot,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }),
                            ));
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: largeSpacing,
            ),
            const AppIconPalette(),
          ],
        ),
      );
    });
  }
}
