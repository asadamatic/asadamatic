import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:flutter/material.dart';

class AsadHameed extends StatelessWidget {
  const AsadHameed({Key? key, this.screen, this.textTheme}) : super(key: key);

  final Screen? screen;
  final TextTheme? textTheme;
  @override
  Widget build(BuildContext context) {
    final fontSize = screen == Screen.large
        ? textTheme!.headline1!.fontSize
        : screen == Screen.medium
            ? textTheme!.headline2!.fontSize
            : textTheme!.headline4!.fontSize;
    final double imageSize = screen == Screen.large
        ? 300.0
        : screen == Screen.medium
            ? 240
            : 180;

    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 2000),
        tween: Tween<double>(begin: 50.0, end: 1.0),
        child: Align(
          alignment: Alignment.center,
          child: Image(
            image: const AssetImage('assets/me.png'),
            height: imageSize,
            width: imageSize,
          ),
        ),
        builder: (context, double value, parentsChild) {
          return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1200),
              tween: Tween<double>(begin: 0.1, end: 1.0),
              builder: (context, double opacity, child) {
                return Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      height: 210.0,
                    ),
                    Positioned(
                        left: 0.0,
                        top: 30.0,
                        child: AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 1200),
                          child: Text(
                            'Asad',
                            style: TextStyle(
                              letterSpacing: value,
                              fontSize: fontSize,
                            ),
                          ),
                        )),
                    TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 1200),
                        tween: Tween<double>(begin: 0.4, end: 1.0),
                        builder: (context, double opacity, child) {
                          return AnimatedOpacity(
                              opacity: opacity,
                              duration: const Duration(milliseconds: 600),
                              child: parentsChild!);
                        }),
                    Positioned(
                        right: 30.0,
                        bottom: 30.0,
                        child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 1200),
                            tween: Tween<double>(begin: 0.1, end: 1.0),
                            builder: (context, double opacity, child) {
                              return AnimatedOpacity(
                                opacity: opacity,
                                duration: const Duration(milliseconds: 1200),
                                child: Text(
                                  'Hameed',
                                  style: TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    letterSpacing: value,
                                    fontSize: fontSize,
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              });
        });
  }
}
