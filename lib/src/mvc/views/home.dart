import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/models/value_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room_container.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/asad_hameed.dart';
import 'package:asadamatic/src/widgets/social_icons_bar.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:asadamatic/src/widgets/value_ticker.dart';
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
                // final smallerWidthBio = (constraints.maxWidth - 1310) / 4;
                // final largerWidthBio =
                //     constraints.maxWidth - 1310 - smallerWidthBio;

                final smallerWidthBio = (constraints.maxWidth - 1250) / 2;
                final largerWidthBio = smallerWidthBio;

                // Large screens
                final smallerWidthApps = (constraints.maxWidth - 1260) / 4;
                final largerWidthApps =
                    constraints.maxWidth - 1260 - smallerWidthApps;

                final positiveConstraintsBio = constraints.maxWidth >= 1250;
                final positiveConstraintsApps = constraints.maxWidth >= 1260;

                return PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        const Flexible(
                            child: SizedBox(
                          height: 150.0,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.cyanAccent,
                              width:
                                  positiveConstraintsBio ? largerWidthBio : 0.0,
                            ),
                            const SizedBox(
                              width: 60.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(height: 50.0),
                                SizedBox(
                                    width: 450.0,
                                    height: 300.0,
                                    child: TweenAnimationBuilder(
                                        duration:
                                            const Duration(milliseconds: 1800),
                                        tween: Tween<double>(
                                            begin: 0,
                                            end: _homeController.bioWords.length
                                                .toDouble()),
                                        builder:
                                            (context, double wordCount, child) {
                                          return GetBuilder<HomeController>(
                                              id: 'updateBio',
                                              builder: (_homeController) {
                                                return RichText(
                                                  text: TextSpan(
                                                    style: textTheme.headline2,
                                                    children: _homeController
                                                        .bioWords
                                                        .take(wordCount.toInt())
                                                        .map<InlineSpan>(
                                                            (word) {
                                                      if (word ==
                                                          _homeController
                                                              .bioWords[6]) {
                                                        return TextSpan(
                                                            text: '\n$word',
                                                            style: TextStyle(
                                                                color: theme
                                                                    .colorScheme
                                                                    .secondary));
                                                      }
                                                      return TextSpan(
                                                          text: word,
                                                          style: TextStyle(
                                                              fontSize: textTheme
                                                                  .headline2!
                                                                  .fontSize));
                                                    }).toList(),
                                                  ),
                                                );
                                              });
                                        })),
                              ],
                            ),
                            Flexible(
                              child: SizedBox(
                                width: positiveConstraintsBio ? 230.0 : 100.0,
                              ),
                            ),
                            const SizedBox(
                                height: 400.0,
                                width: 550.0,
                                child: AsadHameed()),
                            Container(
                              color: Colors.cyanAccent,
                              width: positiveConstraintsBio
                                  ? smallerWidthBio
                                  : 0.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 120.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueHeading(textTheme: textTheme, heading: 'Stackoverflow Reputation', valueType: ValueType.stackoverflow,),
                                ValueTicker(
                                  valueType: ValueType.stackoverflow,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueHeading(textTheme: textTheme, heading: 'Github Repositories', valueType: ValueType.github,),

                                ValueTicker(
                                  valueType: ValueType.github,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueHeading(textTheme: textTheme, heading: 'Commercial Projects', valueType: ValueType.commercialProjects),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    AppConstants.commercialProjects.toString(),
                                    style: textTheme.headline3,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),

                    SizedBox(
                      height: constraints.maxHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: positiveConstraintsApps
                                ? smallerWidthApps
                                : 0.0,
                          ),
                          const SizedBox(
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
                    SizedBox(
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

class ValueHeading extends StatelessWidget {
  const ValueHeading({
    Key? key,
    required this.textTheme,
    required this.heading,
    required this.valueType
  }) : super(key: key);

  final TextTheme textTheme;
  final String? heading;
  final ValueType? valueType;
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    final double width = valueType == ValueType.stackoverflow ? 190 : valueType == ValueType.github ? 150 : 160;
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<double>(
        begin: 0.2,
        end: width,
      ),
      builder: (context, double value, child) {
        return Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading!,
                style: TextStyle(
                  fontSize: textTheme.titleMedium!.fontSize,
                  height: 1.4,
                ),
              ),
              AnimatedContainer(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 2.5, left: 0.0),
                padding: const EdgeInsets.only(left: 0.0),
                height: 4.0,
                width: value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: _themeController.isThemeDark ? Colors.white : Colors.black
                ),
                duration: Duration(milliseconds: 800),
              ),
            ],
          ),
        );
      }
    );
  }
}
