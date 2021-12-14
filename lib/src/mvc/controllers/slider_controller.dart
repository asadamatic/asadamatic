import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:boltgrocery/Screens/home_screen.dart';
import 'package:boltgrocery/main.dart';
import 'package:dailytodo/main.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  final index = 0.obs;

  final apps = [BoltGroceryApp(), DailyTodo()];

  onPageChanged(newIndex) {
    index.value = newIndex;
  }
}
