import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:asadamatic/src/mvc/models/value_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueTicker extends StatelessWidget {
  const ValueTicker({Key? key, required this.valueType, required this.screen})
      : super(key: key);

  final ValueType? valueType;
  final Screen? screen;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.displaySmall;
    return GetBuilder<HomeController>(
        id: 'updateValueTicker',
        builder: (_homeController) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                valueType == ValueType.stackoverflow
                    ? _homeController.stackoverflowScore
                        .toString()
                        .padLeft(4, '0')
                    : valueType == ValueType.github
                        ? _homeController.githubRepoCount
                            .toString()
                            .padLeft(2, '0')
                        : AppConstants.commercialProjects.toString(),
                style: textTheme,
                textAlign:
                    screen == Screen.small ? TextAlign.center : TextAlign.start,
              ),
            ));
  }
}
