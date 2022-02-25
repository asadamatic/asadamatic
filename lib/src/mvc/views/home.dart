import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room_container.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/info_drawer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/drawer_toggle_button.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                if (constraints.maxWidth < AppStyles.breakPointSmallMedium) {
                  return ListView(
                    children: [
                      const SizedBox(height: 100,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Switcher(
                                direction: Axis.horizontal,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: AppStyles.deviceViewWidth,
                              child: DeviceView()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 8.0),
                              child: Obx(() => Text(
                                    AppConstants.descriptions[
                                        _homeController.sliderIndex.value],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            textTheme.headline5!.fontSize),
                                  )))
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      const PackagesSection(),
                      const Footer(),
                    ],
                  );
                } else if (constraints.maxWidth >
                        AppStyles.breakPointSmallMedium &&
                    constraints.maxWidth < AppStyles.breakPointMediumLarge) {
                  return ListView(
                    children: [
                      const SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 30.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Switcher(),
                          ),
                          const SizedBox(
                              width: AppStyles.deviceViewWidth,
                              child: DeviceView()),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: SizedBox(
                                  width: 500.0,
                                  child: Obx(() => Text(
                                        AppConstants.descriptions[
                                            _homeController.sliderIndex.value],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize:
                                                textTheme.headline5!.fontSize),
                                      ))),
                            ),
                          ),
                          constraints.maxWidth >= 1028
                              ? SizedBox(width: constraints.maxWidth - 1028)
                              : const SizedBox()
                        ],
                      ),
                      const PackagesSection(),
                      const Footer(),
                    ],
                  );
                } else {
                  return ListView(
                    children: [
                      const SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Switcher(),
                          ),
                          const SizedBox(
                              width: AppStyles.deviceViewWidth,
                              child: DeviceView()),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Flexible(
                              flex: 3,
                              child: SizedBox(
                                  width: 500.0,
                                  child: Obx(() => Text(
                                        AppConstants.descriptions[
                                            _homeController.sliderIndex.value],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize:
                                                textTheme.headline5!.fontSize),
                                      )))),
                          SizedBox(
                            width: constraints.maxWidth - 970,
                          )
                        ],
                      ),
                      const PackagesSection(),
                      const SizedBox(
                        height: 80.0,
                      ),
                      const Footer(),
                    ],
                  );
                }
              }),
            ),
          ),
          DrawerToggle(),
          Align(
            alignment: Alignment.topRight,
            child: GetBuilder<ThemeController>(builder: (_themeController) {
              return Switch(
                  value: _themeController.themeMode == ThemeMode.dark,
                  onChanged: _themeController.toggleTheme);
            }),
          ),
          // const Positioned(right: 55.0, bottom: 35.0, child: ChatRoomContainer())
        ],
      ),
      floatingActionButton: ChatRoomContainer(),
    );
  }
}
