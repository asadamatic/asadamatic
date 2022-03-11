import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppsSection extends StatelessWidget {
  const AppsSection(
      {Key? key,
      required this.screenHeight,
      required this.positiveConstraintsApps,
      required this.smallerWidthApps,
      required HomeController homeController,
      required this.textTheme,
      required this.largerWidthApps,
      required this.screen})
      : _homeController = homeController,
        super(key: key);

  final double screenHeight;
  final bool positiveConstraintsApps;
  final double smallerWidthApps;
  final HomeController _homeController;
  final TextTheme textTheme;
  final double largerWidthApps;
  final Screen screen;
  @override
  Widget build(BuildContext context) {
    final double contentSpacingNormal = screen == Screen.large
        ? 230.0
        : screen == Screen.medium
            ? 100.0
            : 100.0; // TODO
    final double contentSpacingSmall =
        screen == Screen.small ? 50.0 : 50.0; // TODO

    return SizedBox(
      height: screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // TODO different
        children: [
          SizedBox(
            width: positiveConstraintsApps ? smallerWidthApps : 0.0,
          ),
          const SizedBox(
            width: 60.0,
          ),
          Switcher(),
          const SizedBox(
            width: 20.0,
          ),
          const SizedBox(
              width: AppStyles.deviceViewWidthLarge, // TODO different
              child: DeviceView()),
          SizedBox(
            width: positiveConstraintsApps
                ? contentSpacingNormal
                : contentSpacingSmall,
          ),
          Flexible(
              flex: 3,
              child: AppDescription(
                  screen: screen,
                  homeController: _homeController,
                  textTheme: textTheme)),
          const SizedBox(
            width: 60.0,
          ),
          SizedBox(
            width: positiveConstraintsApps ? largerWidthApps : 0.0,
          ),
        ],
      ),
    );
  }
}

class AppDescription extends StatelessWidget {
  const AppDescription(
      {Key? key,
      required this.screen,
      required HomeController homeController,
      required this.textTheme})
      : _homeController = homeController,
        super(key: key);

  final Screen screen;
  final HomeController _homeController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final descriptionFontStyle = screen == Screen.large
        ? textTheme.headline4!
        : screen == Screen.medium
            ? textTheme.headline5!
            : textTheme.headline6!;
    final titleFontStyle = screen == Screen.small
        ? textTheme.headline5!
        : textTheme.headline4!; // T
    final smallScreen = screen == Screen.small;
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: smallScreen
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.descriptions[_homeController.sliderIndex.value][0],
              style: titleFontStyle,
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 500.0,
              height: 300.0,
              child: Obx(() => Text(
                    AppConstants.descriptions[_homeController.sliderIndex.value]
                        [1],
                    textAlign: smallScreen ? TextAlign.center : TextAlign.start,
                    style: descriptionFontStyle,
                  )),
            )
          ],
        ));
  }
}
