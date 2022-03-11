import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room_container.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/apps_section.dart';
import 'package:asadamatic/src/widgets/asad_hameed.dart';
import 'package:asadamatic/src/widgets/bio_contianer.dart';
import 'package:asadamatic/src/widgets/score.dart';
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
                        SizedBox(
                          width: 330.0,
                          height: 320.0,
                          child: AsadHameed(
                            screen: Screen.small,
                            textTheme: textTheme,
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                            width: 270.0,
                            height: 200.0,
                            child: TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 1800),
                                tween: Tween<double>(
                                    begin: 0,
                                    end: _homeController.bioWords.length
                                        .toDouble()),
                                builder: (context, double wordCount, child) {
                                  return GetBuilder<HomeController>(
                                      id: 'updateBio',
                                      builder: (_homeController) {
                                        return RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: _homeController.bioWords
                                                .take(wordCount.toInt())
                                                .map<InlineSpan>((word) {
                                              if (word ==
                                                  _homeController.bioWords[6]) {
                                                return TextSpan(
                                                    text: '\n$word',
                                                    style: TextStyle(
                                                        fontSize: textTheme
                                                            .headline4!
                                                            .fontSize,
                                                        color: theme.colorScheme
                                                            .secondary));
                                              }
                                              return TextSpan(
                                                  text: word,
                                                  style: textTheme.headline4!);
                                            }).toList(),
                                          ),
                                        );
                                      });
                                })),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Score(
                          textTheme: textTheme,
                          screen: Screen.small,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
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
                            width: AppStyles.deviceViewWidthSmall,
                            child: DeviceView()),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60.0, vertical: 8.0),
                            child: AppDescription(
                                screen: Screen.small,
                                homeController: _homeController,
                                textTheme: textTheme))
                      ],
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    const PackagesSection(),
                    const Footer(),
                  ],
                );
              } else if (constraints.maxWidth >=
                      AppStyles.breakPointSmallMedium &&
                  constraints.maxWidth <= AppStyles.breakPointMediumLarge) {
                final smallerWidthBio = (constraints.maxWidth - 1010) / 2;
                final largerWidthBio = smallerWidthBio;

                // Large screens
                final smallerWidthApps = (constraints.maxWidth - 1010) / 4;
                final largerWidthApps =
                    constraints.maxWidth - 1010 - smallerWidthApps;

                final positiveConstraintsBio = constraints.maxWidth >= 1010;
                final positiveConstraintsApps = constraints.maxWidth >= 1010;

                final screenHeight = constraints.maxHeight;

                return PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    BioContainer(
                      screenHeight: screenHeight,
                      positiveConstraintsBio: positiveConstraintsBio,
                      largerWidthBio: largerWidthBio,
                      homeController: _homeController,
                      textTheme: textTheme,
                      theme: theme,
                      smallerWidthBio: smallerWidthBio,
                      screen: Screen.medium,
                    ),
                    AppsSection(
                      screenHeight: screenHeight,
                      positiveConstraintsApps: positiveConstraintsApps,
                      smallerWidthApps: smallerWidthApps,
                      homeController: _homeController,
                      textTheme: textTheme,
                      largerWidthApps: largerWidthApps,
                      screen: Screen.medium,
                    ),
                    SizedBox(
                      height: screenHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          PackagesSection(),
                          Footer(),
                        ],
                      ),
                    )
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

                final screenHeight = constraints.maxHeight;
                return PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    // Box 1
                    BioContainer(
                      screenHeight: screenHeight,
                      positiveConstraintsBio: positiveConstraintsBio,
                      largerWidthBio: largerWidthBio,
                      homeController: _homeController,
                      textTheme: textTheme,
                      theme: theme,
                      smallerWidthBio: smallerWidthBio,
                      screen: Screen.large,
                    ),
                    // Box 2
                    AppsSection(
                      screenHeight: screenHeight,
                      positiveConstraintsApps: positiveConstraintsApps,
                      smallerWidthApps: smallerWidthApps,
                      homeController: _homeController,
                      textTheme: textTheme,
                      largerWidthApps: largerWidthApps,
                      screen: Screen.medium,
                    ),
                    // Box 3

                    ContributionsSection(screenHeight: screenHeight),
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

class ContributionsSection extends StatelessWidget {
  const ContributionsSection({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
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
    );
  }
}
