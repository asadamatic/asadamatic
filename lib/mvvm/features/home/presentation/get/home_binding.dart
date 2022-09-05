
import 'package:asadamatic/mvvm/core/get/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
class HomeBinding implements Bindings{

  @override
  void dependencies() {

    Get.put<HomeController>(HomeController());
    Get.put<ThemeController>(ThemeController());
  }
}