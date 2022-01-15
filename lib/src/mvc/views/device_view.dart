import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/widgets/icon_palettes.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceView extends StatelessWidget {
  const DeviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:
        (BuildContext layoutBuilderContext, BoxConstraints constraints) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (constraints.maxWidth > 780) const Spacer(),
            GetBuilder<HomeController>(
              id: 'osHoverUpdate',
              builder: (_homeController) => Flexible(
                flex: 3,
                child: GetBuilder<HomeController>(
                    id: 'sliderIndexUpdate',
                    builder: (_homeController) {
                      return GetBuilder<ThemeController>(
                          builder: (_themeController) {
                        return DeviceFrame(
                            device: _homeController.osIndex.value == 0
                                ? Devices.ios.iPhone12
                                : Devices.android.samsungGalaxyS20,
                            isFrameVisible: true,
                            screen: _homeController.getSliderApp());
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const AppIconPalette(),
            if (constraints.maxWidth > 780) const Spacer(),
          ],
        ),
      );
    });
  }
}
