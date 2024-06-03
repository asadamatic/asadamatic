import 'package:asadamatic/src/constant/extensions.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

class MyDescription extends StatelessWidget {
  const MyDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final HomeController _homeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder(
            duration: const Duration(milliseconds: 600),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double opacity, child) {
              final responsiveTextStyle =
                  responsive_framework.ResponsiveValue<TextStyle>(context,
                      defaultValue: textTheme.headlineLarge,
                      conditionalValues: [
                    responsive_framework.Condition.equals(
                        name: responsive_framework.MOBILE,
                        value: textTheme.headlineLarge),
                    responsive_framework.Condition.equals(
                        name: responsive_framework.TABLET,
                        value: textTheme.displayMedium),
                    responsive_framework.Condition.smallerThan(
                        name: responsive_framework.DESKTOP,
                        value: textTheme.displaySmall),
                    responsive_framework.Condition.equals(
                        name: responsive_framework.DESKTOP,
                        value: textTheme.displayLarge),
                  ]).value;
              return GetBuilder<HomeController>(
                  id: 'updateBio',
                  builder: (_homeController) {
                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: opacity,
                      child: RichText(
                        textHeightBehavior: TextHeightBehavior(),
                        text: TextSpan(
                          style: textTheme.displayMedium,
                          children: [
                            TextSpan(
                                text: bio.trailingSpace,
                                style: responsiveTextStyle),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedSize(
                                    duration: Duration(milliseconds: 600),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: Text(
                                        Platforms
                                            .values[_homeController
                                                .bioPlatformIndex]
                                            .displayName,
                                        key: ValueKey<int>(
                                            _homeController.bioPlatformIndex),
                                        style: responsiveTextStyle.copyWith(
                                            color: theme.colorScheme.secondary),
                                      ),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  ),

                                  SizedBox(width: mediumSpacing), //
                                  Icon(
                                    Platforms
                                        .values[
                                            _homeController.bioPlatformIndex]
                                        .icon,
                                    size: responsiveTextStyle.fontSize,
                                    color: theme.colorScheme.secondary,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
        SizedBox(
          height: largeSpacing,
        ),
        Wrap(
          runSpacing: mediumSpacing,
          spacing: largeSpacing,
          children: tools.map((tool) {
            final bool isThemeDark = colorScheme.brightness == Brightness.dark;
            return SvgPicture.asset(
              isThemeDark ? tool.darkModeLogoPath : tool.logoPath,
              fit: BoxFit.cover,
              height: 40,
            );
          }).toList(),
        )
      ],
    );
  }
}
