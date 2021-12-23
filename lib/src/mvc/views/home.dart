import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/info_drawer.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final ThemeController _themeController = Get.put(ThemeController());
  final SliderController _sliderController = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.loose,
      children: [
        Container(),
        InfoDrawer(),
        PositionedTransition(
          rect: _homeController.animation!,
          child: Material(
            elevation: 8.0,
            child: LayoutBuilder(builder: (BuildContext layoutBuilderContext,
                BoxConstraints constraints) {
              if (constraints.maxWidth < 780) {
                return Column(
                  children: [
                    const Spacer(),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Switcher(
                          direction: Axis.horizontal,
                        ),
                      ),
                    ),
                    const Expanded(flex: 4, child: DeviceView()),
                    const SizedBox(
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
              } else if (constraints.maxWidth > 780 &&
                  constraints.maxWidth < 1024) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Switcher(),
                      ),
                    ),
                    const Flexible(flex: 1, child: DeviceView()),
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
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Switcher(),
                      ),
                    ),
                    const Flexible(flex: 1, child: DeviceView()),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.006,
                    // ),
                    Expanded(
                        flex: 3,
                        child: Obx(() => Transform.scale(
                              scale: MediaQuery.of(context).size.width * 0.0005,
                              child: Text(
                                descriptions[_sliderController.index.value],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .fontSize),
                              ),
                            ))),
                    const Spacer(),
                  ],
                );
              }
            }),
          ),
        ),
        PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height / 2 - 35.0,
                  MediaQuery.of(context).size.width - 35,
                  MediaQuery.of(context).size.height / 2 - 35.0),
              end: RelativeRect.fromLTRB(
                  300,
                  MediaQuery.of(context).size.height / 2 - 35.0,
                  MediaQuery.of(context).size.width - 335,
                  MediaQuery.of(context).size.height / 2 - 35.0),
            ).animate(CurvedAnimation(
                parent: _homeController.animationController!,
                curve: Curves.easeIn)),
            child: Container(
              height: 35.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: _themeController.themeMode == ThemeMode.dark
                      ? Colors.black87
                      : Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35.0),
                      topRight: Radius.circular(35.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5)
                    .animate(_homeController.animationController!),
                child: GetBuilder<HomeController>(
                    builder: (_homeControllerNewNew) {
                  return IconButton(
                    onPressed: _homeControllerNewNew.isShowingDrawer.value
                        ? _homeControllerNewNew.hideDrawer
                        : _homeControllerNewNew.showDrawer,
                    icon: const Icon(Icons.navigate_next_outlined),
                  );
                }),
              ),
            )),
        Align(
          alignment: Alignment.topRight,
          child: GetBuilder<ThemeController>(builder: (_themeController) {
            return Switch(
                value: _themeController.themeMode == ThemeMode.dark,
                onChanged: _themeController.toggleTheme);
          }),
        )
      ],
    ));
  }
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
