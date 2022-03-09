import 'dart:async';

import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/value_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueTicker extends StatelessWidget {
  const ValueTicker({Key? key, this.valueType}) : super(key: key);

  final ValueType? valueType;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline3;
    return GetBuilder<HomeController>(
        id: 'updateValueTicker',
        builder: (_homeController) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
               valueType == ValueType.stackoverflow ? _homeController.stackoverflowScore.toString().padLeft(4, '0') : _homeController.githubRepoCount.toString().padLeft(2, '0'),
                style: textTheme,
              ),
        ));
  }
}


