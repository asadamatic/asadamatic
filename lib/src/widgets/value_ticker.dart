import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

class AnimatedValueTicker extends StatelessWidget {
  const AnimatedValueTicker({Key? key, required this.score}) : super(key: key);

  final int score;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final responsiveTextStyle = responsive_framework.ResponsiveValue<TextStyle>(
        context,
        defaultValue: textTheme.titleLarge,
        conditionalValues: [
          responsive_framework.Condition.equals(
              name: responsive_framework.MOBILE, value: textTheme.titleLarge),
          responsive_framework.Condition.equals(
              name: responsive_framework.TABLET,
              value: textTheme.headlineMedium),
          responsive_framework.Condition.largerThan(
              name: responsive_framework.TABLET,
              value: textTheme.headlineLarge),
        ]).value;
    return GetBuilder<HomeController>(
        id: 'updateValueTicker',
        builder: (_homeController) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                score.toString().padLeft(2, "0"),
                style: responsiveTextStyle,
              ),
            ));
  }
}
