import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room_container.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/asad_hameed.dart';
import 'package:asadamatic/src/widgets/social_icons_bar.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  // ignore: unused_field
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(),
          PositionedTransition(
            rect: _homeController.animation!,
            child: Material(
              elevation: 8.0,
              child: LayoutBuilder(builder: (BuildContext layoutBuilderContext,
                  BoxConstraints constraints) {
                if (constraints.maxWidth < AppStyles.breakPointSmallMedium) {
                  return ListView(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
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
                              width: AppStyles.deviceViewWidthLarge,
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
                      const SizedBox(
                        height: 100,
                      ),
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
                              width: AppStyles.deviceViewWidthLarge,
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
                  final smallerWidthBio = (constraints.maxWidth - 1280) / 4;
                  final largerWidthBio =
                      constraints.maxWidth - 1280 - smallerWidthBio;

                  // Large screens
                  final smallerWidthApps = (constraints.maxWidth - 1200) / 4;
                  final largerWidthApps =
                      constraints.maxWidth - 1200 - smallerWidthApps;

                  final positiveConstraintsBio = constraints.maxWidth >= 1280;
                  final positiveConstraintsApps = constraints.maxWidth >= 1200;

                  return PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        color: Colors.purpleAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: positiveConstraintsBio ? largerWidthBio : 0.0,
                            ),
                            Flexible(
                                flex: 3,
                                child: SizedBox(
                                    width: 500.0,
                                    height: 264.0,
                                    child: TweenAnimationBuilder(
                                        duration: const Duration(milliseconds: 1800),
                                        tween: Tween<double>(
                                            begin: 0,
                                            end: AppConstants.bioWords.length
                                                .toDouble()),
                                        builder:
                                            (context, double wordCount, child) {
                                          return RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: textTheme
                                                      .headline2!.fontSize),
                                              children: AppConstants.bioWords
                                                  .take(wordCount.toInt())
                                                  .map<InlineSpan>((word) {
                                                if (word.length > 1) {
                                                  return TextSpan(
                                                      text: word[0],
                                                      style: TextStyle(
                                                          color: theme
                                                              .colorScheme
                                                              .secondary));
                                                }
                                                return TextSpan(
                                                  text: word[0],
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        }))),
                            const SizedBox(
                              width: 230.0,
                            ),
                            const AsadHameed(),
                            SizedBox(
                              width: positiveConstraintsBio ? smallerWidthBio : 0.0,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.greenAccent,
                        height: constraints.maxHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: positiveConstraintsApps ? smallerWidthApps : 0.0,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Switcher(),
                            ),
                            const SizedBox(
                                width: AppStyles.deviceViewWidthLarge,
                                child: DeviceView()),
                            const SizedBox(
                              width: 230.0,
                            ),
                            Flexible(
                                flex: 3,
                                child: SizedBox(
                                    width: 500.0,
                                    child: Obx(() => Text(
                                          AppConstants.descriptions[
                                              _homeController
                                                  .sliderIndex.value],
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: textTheme
                                                  .headline3!.fontSize),
                                        )))),
                            SizedBox(
                              width: positiveConstraintsApps ? largerWidthApps : 0.0,
                            ),
                          ],
                        ),
                      ),

                      // Box 2
                      // Creating containers for pageview
                      Container(
                        color: Colors.yellowAccent,
                        height: constraints.maxHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            PackagesSection(),
                            SizedBox(
                              height: 80.0,
                            ),
                            Footer(),
                          ],
                        ),
                      )
                    ],
                  );
                }
              }),
            ),
          ),
          Align(alignment: Alignment.centerLeft, child: SocialIconsBar()),
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
