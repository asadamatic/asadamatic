import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:asadamatic/src/widgets/asad_hameed.dart';
import 'package:asadamatic/src/widgets/score.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioContainer extends StatelessWidget {
  const BioContainer({
    Key? key,
    required this.screenHeight,
    required this.positiveConstraintsBio,
    required this.largerWidthBio,
    required HomeController homeController,
    required this.textTheme,
    required this.theme,
    required this.smallerWidthBio,
    required this.screen,
  })  : _homeController = homeController,
        super(key: key);

  final double screenHeight;
  final bool positiveConstraintsBio;
  final double largerWidthBio;
  final HomeController _homeController;
  final TextTheme textTheme;
  final ThemeData theme;
  final double smallerWidthBio;
  final Screen screen;

  @override
  Widget build(BuildContext context) {
    final descriptionFontSize = screen == Screen.large
        ? textTheme.headline2!.fontSize
        : screen == Screen.medium
            ? textTheme.headline3!.fontSize
            : textTheme.headline4!.fontSize; // TODo
    final double asadhameedWidth = screen == Screen.large
        ? 550
        : screen == Screen.medium
            ? 360.0
            : 370.0; // TODo
    final double asadhameedHeight = screen == Screen.large
        ? 400
        : screen == Screen.medium
            ? 350
            : 350;

    final double descriptionWidth = screen == Screen.large
        ? 450
        : screen == Screen.medium
            ? 350.0
            : 350.0; // TODo

    final double contentSpacingNormal = screen == Screen.large
        ? 230.0
        : screen == Screen.medium
            ? 100.0
            : 100.0; // TODO
    final double contentSpacingSmall = screen == Screen.large
        ? 50.0
        : screen == Screen.medium
            ? 50.0
            : 50.0; // TODO
    final mediumScreen = screen == Screen.medium;
    return SizedBox(
      height: screenHeight,
      child: Column(
        children: [
          const Flexible(
              child: SizedBox(
            height: 150.0,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: positiveConstraintsBio ? largerWidthBio : 0.0,
              ),
              const SizedBox(
                width: 60.0,
              ),
              // Same
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   SizedBox(height:  mediumScreen ? 100.0 : 50.0),
                  SizedBox(
                      width: descriptionWidth,
                      height: 300.0,
                      child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 1800),
                          tween: Tween<double>(
                              begin: 0,
                              end: _homeController.bioWords.length.toDouble()),
                          builder: (context, double wordCount, child) {
                            return GetBuilder<HomeController>(
                                id: 'updateBio',
                                builder: (_homeController) {
                                  return RichText(
                                    text: TextSpan(
                                      style: textTheme.headline2,
                                      children: _homeController.bioWords
                                          .take(wordCount.toInt())
                                          .map<InlineSpan>((word) {
                                        if (word ==
                                            _homeController.bioWords[6]) {
                                          return TextSpan(
                                              text: '\n$word',
                                              style: TextStyle(
                                                  fontSize: descriptionFontSize,
                                                  color: theme
                                                      .colorScheme.secondary));
                                        }
                                        return TextSpan(
                                            text: word,
                                            style: TextStyle(
                                                fontSize: descriptionFontSize));
                                      }).toList(),
                                    ),
                                  );
                                });
                          })),
                ],
              ),
              Flexible(
                child: SizedBox(
                  width: positiveConstraintsBio
                      ? contentSpacingNormal
                      : contentSpacingSmall,
                ),
              ),
              SizedBox(
                  width: asadhameedWidth,
                  height: asadhameedHeight,
                  child: AsadHameed(
                    screen: screen,
                    textTheme: textTheme,
                  )),
              const SizedBox(
                height: 60.0,
              ),
              SizedBox(
                width: positiveConstraintsBio ? smallerWidthBio : 0.0,
              ),
            ],
          ),
          const SizedBox(
            height: 120.0,
          ),
          // Done
          Score(textTheme: textTheme, screen: screen)
        ],
      ),
    );
  }
}
