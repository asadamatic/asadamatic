import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({
    Key? key,
    this.screen,
    required HomeController homeController,
    required this.textTheme,
    required this.theme,
  })  : _homeController = homeController,
        super(key: key);
  final Screen? screen;
  final HomeController _homeController;
  final TextTheme textTheme;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final double descriptionWidth = screen == Screen.large
        ? 450
        : screen == Screen.medium
            ? 350.0
            : 270.0;

    final double descriptionHeight = screen == Screen.small ? 200.0 : 300.0;
    final descriptionFontSize = screen == Screen.large
        ? textTheme.headline2!.fontSize
        : screen == Screen.medium
            ? textTheme.headline3!.fontSize
            : textTheme.headline4!.fontSize;
    final smallScreen = screen == Screen.small;
    return SizedBox(
        width: descriptionWidth,
        height: descriptionHeight,
        child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1800),
            tween: Tween<double>(
                begin: 0, end: _homeController.bioWords.length.toDouble()),
            builder: (context, double wordCount, child) {
              return GetBuilder<HomeController>(
                  id: 'updateBio',
                  builder: (_homeController) {
                    return RichText(
                      textAlign:
                          smallScreen ? TextAlign.center : TextAlign.start,
                      text: TextSpan(
                        style: textTheme.headline2,
                        children: _homeController.bioWords
                            .take(wordCount.toInt())
                            .map<InlineSpan>((word) {
                          if (word == _homeController.bioWords[6]) {
                            return TextSpan(
                                text: '\n$word',
                                style: TextStyle(
                                    fontSize: descriptionFontSize,
                                    color: theme.colorScheme.secondary));
                          }
                          return TextSpan(
                              text: word,
                              style: TextStyle(fontSize: descriptionFontSize));
                        }).toList(),
                      ),
                    );
                  });
            }));
  }
}
