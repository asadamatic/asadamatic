import 'package:boltgrocery/main.dart';
import 'package:dailytodo/main.dart';
import 'package:get/get.dart';
import 'package:legacyweather/main.dart';

class SliderController extends GetxController {
  final index = 0.obs;
  double height = 30.0;
  double increasedHeight = 2.5;

  onPageChanged(newIndex) {
    index.value = newIndex;
    update(['boltgrocery', 'dailytodo', 'legacyweather', 'pageview']);
  }

  getApp() {
    return index.value == 0
        ? BoltGroceryApp()
        : index.value == 1
            ? DailyTodoApp()
            : LegacyWeatherApp();
  }

  onHover(package) {
    height = 30.0;
    increasedHeight = 2.5;
    update([package]);
  }

  onHoverRemoved(package) {
    height = 25.0;
    increasedHeight = 0.0;
    update([package]);
  }
}
