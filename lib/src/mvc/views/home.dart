import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/main.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/info_drawer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final ThemeController _themeController = Get.put(ThemeController());
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
                  return ListView(
                    children: [
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
                          const SizedBox(width: 250.0, child: DeviceView()),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 8.0),
                              child: Obx(() => Text(
                                    descriptions[
                                        _homeController.sliderIndex.value],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .fontSize),
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
                } else if (constraints.maxWidth > 780 &&
                    constraints.maxWidth < 1024) {
                  return ListView(
                    children: [
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
                          const SizedBox(width: 250.0, child: DeviceView()),
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
                                        descriptions[
                                            _homeController.sliderIndex.value],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .fontSize),
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
                          const SizedBox(width: 250.0, child: DeviceView()),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Flexible(
                              flex: 3,
                              child: SizedBox(
                                  width: 500.0,
                                  child: Obx(() => Text(
                                        descriptions[
                                            _homeController.sliderIndex.value],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .fontSize),
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
      floatingActionButton: const ChatRoomContainer(),
    );
  }
}

class ChatRoomContainer extends StatelessWidget {
  const ChatRoomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'updateChatRoomContainer',
        builder: (_controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  width: _controller.chatRoomWidth,
                  height: _controller.chatRoomHeight,
                  duration: const Duration(milliseconds: 600),
                  child:
                      GetBuilder<ThemeController>(builder: (_themeController) {
                    return Offstage(
                      offstage: !_controller.chatRoomOpen,
                      child: Stack(
                        children: [ChatRoom(), const ChatRoomActions()],
                      ),
                    );
                  }),
                ),
              ),
              FloatingActionButton(
                onPressed: _controller.toggleChatRoom,
                child: Icon(_controller.chatRoomOpen
                    ? Icons.keyboard_arrow_down
                    : Icons.chat),
              )
            ],
          );
        });
  }
}

class ChatRoomActions extends StatelessWidget {
  const ChatRoomActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: ChatRoomValues.chatRoomActions
            .map(
              (chatRoomAction) => InkWell(
                onTap: () => chatRoomAction == ChatRoomValues.resizeIcon
                    ? _homeController.changeChatRoomSize(
                        maxHeight: MediaQuery.of(context).size.height,
                        maxWidth: MediaQuery.of(context).size.width)
                    : _homeController.toggleChatRoom(),
                child: Container(
                    margin: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    height: ChatRoomValues.actionSize,
                    width: ChatRoomValues.actionSize,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ChatRoomValues.actionSize),
                    ),
                    child: chatRoomAction),
              ),
            )
            .toList());
  }
}

class DrawerToggle extends StatelessWidget {
  DrawerToggle({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();
  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
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
                id: 'drawerUpdate',
                builder: (_homeController) {
                  return IconButton(
                    onPressed: _homeController.isShowingDrawer.value
                        ? _homeController.hideDrawer
                        : _homeController.showDrawer,
                    icon: const Icon(Icons.navigate_next_outlined),
                  );
                }),
          ),
        ));
  }
}

class DemoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
