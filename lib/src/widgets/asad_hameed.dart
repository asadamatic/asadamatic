import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:flutter/material.dart';

class AsadHameed extends StatelessWidget {
  const AsadHameed({Key? key, this.screen, this.textTheme}) : super(key: key);

  final Screen? screen;
  final TextTheme? textTheme;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1200),
        tween: Tween<double>(begin: 0.1, end: 1.0),
        builder: (context, double opacity, child) {
          return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1200),
              tween: Tween<double>(begin: 0.4, end: 1.0),
              builder: (context, double opacity, child) {
                return AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 600),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('assets/me.png'),
                      ),
                    ));
              });
        });
  }
}
