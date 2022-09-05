import 'package:asadamatic/mvvm/core/constants/values.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueTicker extends StatelessWidget {
  const ValueTicker({Key? key, required this.valueType, required this.screen})
      : super(key: key);

  final ValueType? valueType;
  final Screen? screen;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline3;
    return GetBuilder<HomeController>(
        id: 'updateValueTicker',
        builder: (_homeController) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                getValue(_homeController),
                style: textTheme,
                textAlign: TextAlign.center,
              ),
            ));
  }

  getValue(_homeController) {
    return valueType == ValueType.stackoverflow
        ? _homeController.stackoverflowScore.toString().padLeft(4, '0')
        : valueType == ValueType.github
            ? _homeController.githubRepoCount.toString().padLeft(2, '0')
            : HomeConstants.commercialProjects.toString();
  }
}
