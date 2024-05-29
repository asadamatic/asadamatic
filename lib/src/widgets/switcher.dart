import 'package:asadamatic/src/enums.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/os_logo_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OSSwitcher extends StatelessWidget {
  const OSSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.onInverseSurface,
      child: Padding(
        padding: const EdgeInsets.all(smallSpacing),
        child: GetBuilder<HomeController>(
            id: 'osIndexUpdate',
            builder: (_homeController) {
              return Flex(
                direction: ResponsiveBreakpoints.of(context).isMobile
                    ? Axis.horizontal
                    : Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                children: Os.values
                    .map(
                      (os) => OsIcon(
                        isSelected: _homeController.selectedOs.value == os,
                        os: os,
                      ),
                    )
                    .toList(),
              );
            }),
      ),
    );
  }
}

class OsIcon extends StatelessWidget {
  const OsIcon({
    super.key,
    required this.isSelected,
    required this.os,
  });

  final Os os;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    final HomeController _homeController = Get.find();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 60.0,
      child: Card(
        color: isSelected ? colorScheme.surface : colorScheme.onInverseSurface,
        clipBehavior: Clip.hardEdge,
        elevation: isSelected ? 10.0 : 0.0,
        margin: const EdgeInsets.all(minSpacing),
        child: InkWell(
          onTap: () => _homeController.onOsChanged(os),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: OsLogoIcon(asset: os.imageAsset),
          ),
        ),
      ),
    );
  }
}
