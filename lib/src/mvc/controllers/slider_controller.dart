import 'package:asadamatic/src/constant/values.dart';
import 'package:boltgrocery/main.dart';
import 'package:dailytodo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:legacyweather/main.dart';

class SliderController extends GetxController {
  final index = 0.obs;
  double height = 30.0;
  double increasedHeight = 2.5;
  final apps = [BoltGroceryApp(), DailyTodoApp(), LegacyWeatherApp()];

  onPageChanged(newIndex) {
    index.value = newIndex;
    update(appLogoIcons.map((appLogoIcon) => appLogoIcon[1]).toList());
  }
  getApp(){
    return apps[index.value];
  }

  onHover(package){
    height = 30.0;
    increasedHeight = 2.5;
    update([package]);
  }

  onHoverRemoved(package){
    height = 25.0;
    increasedHeight = 0.0;
    update([package]);
  }
}
