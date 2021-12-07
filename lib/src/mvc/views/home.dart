import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final SliderController _sliderController = Get.put(SliderController());

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(),
            PositionedTransition(
              rect: _homeController.animation!,
              child: Material(
                elevation: 8.0,
                child: Container(
                  color: Colors.white,
                  child: LayoutBuilder(builder:
                      (BuildContext layoutBuilderContext,
                          BoxConstraints constraints) {
                    if (constraints.maxWidth < 780) {
                      return Column(
                        children: [
                          Spacer(),
                          Flexible(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Switcher(
                                direction: Axis.horizontal,
                              ),
                            ),
                          ),
                          Expanded(flex: 4, child: DeviceView()),
                          const SizedBox(
                            width: 100.0,
                          ),
                          Expanded(
                              flex: 2,
                              child: Obx(() => Transform.scale(
                                    scale: MediaQuery.of(context).size.width *
                                        0.0010,
                                    child: Text(
                                      descriptions[
                                          _sliderController.index.value],
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Switcher(),
                            ),
                          ),
                          Flexible(flex: 1, child: DeviceView()),
                          Expanded(
                              flex: 2,
                              child: Obx(() => Transform.scale(
                                    scale: MediaQuery.of(context).size.width *
                                        0.0005,
                                    child: Text(
                                      descriptions[
                                          _sliderController.index.value],
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Switcher(),
                            ),
                          ),
                          Flexible(flex: 1, child: DeviceView()),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.006,
                          // ),
                          Expanded(
                              flex: 3,
                              child: Obx(() => Transform.scale(
                                    scale: MediaQuery.of(context).size.width *
                                        0.0005,
                                    child: Text(
                                      descriptions[
                                          _sliderController.index.value],
                                      textAlign: TextAlign.start,
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
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(35.0),
                          topRight: Radius.circular(35.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
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
                        icon: Icon(Icons.navigate_next_outlined),
                        color: Colors.black,
                      );
                    }),
                  ),
                )),
          ],
        ));
  }
}
