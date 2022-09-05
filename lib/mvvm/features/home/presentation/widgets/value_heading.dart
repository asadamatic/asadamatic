import 'package:asadamatic/mvvm/core/get/controllers/theme_controller.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueHeading extends StatelessWidget {
  const ValueHeading(
      {Key? key,
      required this.textTheme,
      required this.heading,
      required this.valueType,
      required this.screen})
      : super(key: key);

  final TextTheme textTheme;
  final String? heading;
  final ValueType? valueType;
  final Screen? screen;
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    // final double width = screen == Screen.small
    //     ? 190.0
    //     : valueType == ValueType.stackoverflow
    //         ? 190
    //         : valueType == ValueType.github
    //             ? 150
    //             : 160;
    const double width = 190;

    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 800),
        tween: Tween<double>(
          begin: 0.2,
          end: width,
        ),
        builder: (context, double value, child) {
          return SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  heading!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textTheme.titleMedium!.fontSize,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 10.0,),
                AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 2.5, left: 0.0),
                  padding: const EdgeInsets.only(left: 0.0),
                  height: 2.0,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: _themeController.isThemeDark
                          ? Colors.white
                          : Colors.black),
                  duration: const Duration(milliseconds: 800),
                ),
              ],
            ),
          );
        });
  }
}
