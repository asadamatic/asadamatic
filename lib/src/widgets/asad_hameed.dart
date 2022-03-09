import 'package:flutter/material.dart';

class AsadHameed extends StatelessWidget {
  const AsadHameed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 2000),
        tween: Tween<double>(begin: 50.0, end: 1.0),
        child: const Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/me.png'),
            height: 300.0,
            width: 300.0,
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
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize,
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
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .fontSize,
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
