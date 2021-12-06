import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/os_controller.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final SliderController _sliderController = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder:
            (BuildContext layoutBuilderContext, BoxConstraints constraints) {
          if (constraints.maxWidth < 780) {
            return Column(
              children: [
                Flexible(child: Switcher(direction: Axis.horizontal,)),
                Spacer(),
                Expanded(flex: 4, child: DeviceView()),
                SizedBox(
                  width: 100.0,
                ),
                Expanded(
                    flex: 2,
                    child: Obx(() => Transform.scale(
                          scale: MediaQuery.of(context).size.width * 0.0010,
                          child: Text(
                            descriptions[_sliderController.index.value],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontSize),
                          ),
                        )))
              ],
            );
          } else {
            return Row(
              children: [
                SizedBox(
                  width: 30.0,
                ),
                Flexible(flex: 1, child: Switcher()),
                Expanded(child: DeviceView()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.006,
                ),
                Expanded(
                    flex: 2,
                    child: Obx(() => Transform.scale(
                          scale: MediaQuery.of(context).size.width * 0.0005,
                          child: Text(
                            descriptions[_sliderController.index.value],
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .fontSize),
                          ),
                        ))),
                Spacer(),
              ],
            );
          }
        }),
      ),
    );
  }
}
