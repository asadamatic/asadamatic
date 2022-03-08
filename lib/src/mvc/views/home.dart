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
          Material(
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
                                      fontSize: textTheme.headline5!.fontSize),
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
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                final smallerWidthBio = (constraints.maxWidth - 1260) / 4;
                final largerWidthBio =
                    constraints.maxWidth - 1260 - smallerWidthBio;

                // Large screens
                final smallerWidthApps = (constraints.maxWidth - 1260) / 4;
                final largerWidthApps =
                    constraints.maxWidth - 1260 - smallerWidthApps;

                final positiveConstraintsBio = constraints.maxWidth >= 1260;
                final positiveConstraintsApps = constraints.maxWidth >= 1260;

                return PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 100.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: positiveConstraintsBio
                                    ? largerWidthBio
                                    : 0.0,
                              ),
                              SizedBox(
                                width: 60.0,
                              ),
                              Flexible(
                                  flex: 3,
                                  child: Container(
                                      width: 400.0,
                                      height: 264.0,
                                      child: TweenAnimationBuilder(
                                          duration: const Duration(
                                              milliseconds: 1800),
                                          tween: Tween<double>(
                                              begin: 0,
                                              end: _homeController
                                                  .bioWords.length
                                                  .toDouble()),
                                          builder: (context,
                                              double wordCount, child) {
                                            return GetBuilder<
                                                    HomeController>(
                                                id: 'updateBio',
                                                builder: (_homeController) {
                                                  return RichText(
                                                    text: TextSpan(
                                                      style: textTheme
                                                          .headline2,
                                                      children: _homeController
                                                          .bioWords
                                                          .take(wordCount
                                                              .toInt())
                                                          .map<InlineSpan>(
                                                              (word) {
                                                        if (word ==
                                                            _homeController
                                                                    .bioWords[
                                                                4]) {
                                                          return TextSpan(
                                                              text: word,
                                                              style: TextStyle(
                                                                  color: theme
                                                                      .colorScheme
                                                                      .secondary));
                                                        }
                                                        return TextSpan(
                                                          text: word,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  );
                                                });
                                          }))),
                              SizedBox(
                                width: positiveConstraintsBio ? 230.0 : 100.0,
                              ),
                              const AsadHameed(),
                              SizedBox(
                                width: positiveConstraintsBio
                                    ? smallerWidthBio
                                    : 0.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reputation',
                                      style: textTheme.headline5,
                                    ),
                                    Text(
                                      '1300+',
                                      style: textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reputation',
                                      style: textTheme.headline5,
                                    ),
                                    Text(
                                      '1300+',
                                      style: textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Reputation',
                                      style: textTheme.headline5,
                                    ),
                                    Text(
                                      '1300+',
                                      style: textTheme.headline2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: constraints.maxHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: positiveConstraintsApps
                                ? smallerWidthApps
                                : 0.0,
                          ),
                          SizedBox(
                            width: 60.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Switcher(),
                          ),
                          const SizedBox(
                              width: AppStyles.deviceViewWidthLarge,
                              child: DeviceView()),
                          SizedBox(
                            width: positiveConstraintsApps ? 230.0 : 50.0,
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
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                textTheme.headline3!.fontSize),
                                      )))),
                          SizedBox(
                            width:
                                positiveConstraintsApps ? largerWidthApps : 0.0,
                          ),
                        ],
                      ),
                    ),

                    // Box 2
                    // Creating containers for pageview
                    Container(
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
