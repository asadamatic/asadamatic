import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/device_view.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;
import 'package:url_launcher/url_launcher.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile =
        responsive_framework.ResponsiveBreakpoints.of(context).isMobile;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: massiveSpacing, vertical: massiveSpacing),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (isMobile)
            Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: const [
                OSSwitcher(),
                DeviceView(),
              ],
            )
          else
            Flexible(
              flex: 2,
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                children: const [
                  OSSwitcher(),
                  DeviceView(),
                ],
              ),
            ),
          if (isMobile)
            const AppDescription()
          else
            const Expanded(flex: 2, child: AppDescription()),
        ],
      ),
    );
  }
}

class AppDescription extends StatelessWidget {
  const AppDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final HomeController _homeController = Get.find();

    final responsiveTextStyleHeading =
        responsive_framework.ResponsiveValue<TextStyle>(context,
            defaultValue: textTheme.headlineMedium,
            conditionalValues: [
          responsive_framework.Condition.equals(
              name: responsive_framework.MOBILE,
              value: textTheme.headlineSmall),
          responsive_framework.Condition.equals(
              name: responsive_framework.TABLET,
              value: textTheme.headlineMedium),
          responsive_framework.Condition.largerThan(
              name: responsive_framework.TABLET, value: textTheme.displaySmall),
          responsive_framework.Condition.equals(
              name: responsive_framework.DESKTOP,
              value: textTheme.displaySmall),
        ]).value;
    final responsiveTextStyleDescription =
        responsive_framework.ResponsiveValue<TextStyle>(context,
            defaultValue: textTheme.bodyLarge,
            conditionalValues: [
          responsive_framework.Condition.equals(
              name: responsive_framework.MOBILE, value: textTheme.titleMedium),
          responsive_framework.Condition.equals(
              name: responsive_framework.TABLET, value: textTheme.titleLarge),
          responsive_framework.Condition.largerThan(
              name: responsive_framework.TABLET,
              value: textTheme.headlineMedium),
          responsive_framework.Condition.equals(
              name: responsive_framework.DESKTOP,
              value: textTheme.headlineMedium),
        ]).value;
    return Padding(
      padding: const EdgeInsets.all(largeSpacing),
      child: Obx(() {
        final app = _homeController.selectedApp.value;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(child: child, opacity: animation);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                app.name,
                style: responsiveTextStyleHeading,
              ),
              const SizedBox(height: largeSpacing),
              Text(
                app.description,
                style: responsiveTextStyleDescription,
              ),
              SizedBox(
                height: hugeSpacing,
              ),
              Wrap(
                spacing: mediumSpacing,
                runSpacing: mediumSpacing,
                children: [
                  StoreBadge(
                    onTap: () => launchUrl(Uri.parse(app.playStoreLink)),
                    imageAsset: playStoreBadge,
                  ),
                  StoreBadge(
                    onTap: () => launchUrl(Uri.parse(app.playStoreLink)),
                    imageAsset: appStoreBadge,
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

class StoreBadge extends StatelessWidget {
  const StoreBadge({
    super.key,
    required this.onTap,
    required this.imageAsset,
  });
  final Function() onTap;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        imageAsset,
        clipBehavior: Clip.hardEdge,
        height: 50.0,
      ),
    );
  }
}
