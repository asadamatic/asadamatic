import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/os_controller.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/widgets/icon_palettes.dart';
import 'package:boltgrocery/main.dart';
import 'package:dailytodo/main.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:legacyweather/main.dart';

class DeviceView extends StatelessWidget {
  DeviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:
        (BuildContext layoutBuilderContext, BoxConstraints constraints) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (constraints.maxWidth > 780) const Spacer(),
            GetBuilder<OsController>(
              builder: (_controller) => Flexible(
                flex: 3,
                child: GetBuilder<SliderController>(
                  builder: (_sliderController) {
                    return DeviceFrame(
                      device: _controller.index.value == 0
                          ? Devices.ios.iPhone12
                          : Devices.android.samsungGalaxyS20,
                      isFrameVisible: true,
                      screen: _sliderController.getApp()
                    );
                  }
                ),
              ),
            ),
            const AppIconPalette(),
            if (constraints.maxWidth > 780) const Spacer(),
          ],
        ),
      );
    });
  }
}
