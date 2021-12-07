import 'package:asadamatic/src/mvc/controllers/os_controller.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceView extends StatelessWidget {
  DeviceView({Key? key}) : super(key: key);

  final SliderController _sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:
        (BuildContext layoutBuilderContext, BoxConstraints constraints) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(constraints.maxWidth > 780)const Spacer(),
            GetBuilder<OsController>(
              builder: (_controller) => Flexible(
                flex: 3,
                child: DeviceFrame(
                  device: _controller.index.value == 0
                      ? Devices.ios.iPhone12
                      : Devices.android.samsungGalaxyS20,
                  isFrameVisible: true,
                  screen: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: _sliderController.onPageChanged,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/test.png'));
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 26.0,
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isCurrent = index == _sliderController.index.value;

                      return AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          width: isCurrent ? 20.0 : 12.0,
                          height: 12.0,
                          decoration: BoxDecoration(
                              color: isCurrent ? Colors.grey[900] : Colors.grey,
                              borderRadius: BorderRadius.circular(10.0)));
                    });
                  }),
            ),
            if(constraints.maxWidth > 780)const Spacer(),
          ],
        ),
      );
    });
  }
}
