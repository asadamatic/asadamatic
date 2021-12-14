import 'package:boltgrocery/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final index = 0.obs;

  final apps = [BoltGroceryApp(), Container()];

  onPageChanged(newIndex) {
    index.value = newIndex;
  }
}
