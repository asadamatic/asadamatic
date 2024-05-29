import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
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
      children: [
        TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1800),
            tween: Tween<double>(
                begin: 0, end: _homeController.bioWords.length.toDouble()),
            builder: (context, double wordCount, child) {
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
                        value: textTheme.displayMedium),
                    responsive_framework.Condition.equals(
                        name: responsive_framework.DESKTOP,
                        value: textTheme.displayLarge),
                  ]).value;
              return GetBuilder<HomeController>(
                  id: 'updateBio',
                  builder: (_homeController) {
                    return RichText(
                      text: TextSpan(
                        style: textTheme.displayMedium,
                        children: _homeController.bioWords
                            .take(wordCount.toInt())
                            .map<InlineSpan>((word) {
                          if (word == _homeController.bioWords[6]) {
                            return TextSpan(
                                text: word,
                                style: responsiveTextStyle.copyWith(
                                    color: theme.colorScheme.secondary));
                          }
                          return TextSpan(text: word, style: responsiveTextStyle);
                        }).toList(),
                      ),
                    );
                  });
            }),
            
      ],
    );
  }
}
