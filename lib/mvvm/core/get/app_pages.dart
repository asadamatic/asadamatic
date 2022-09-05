import 'package:asadamatic/mvvm/features/home/presentation/get/home_binding.dart';
import 'package:asadamatic/mvvm/features/home/presentation/pages/home.dart';
import 'package:get/get.dart';
import 'package:asadamatic/mvvm/core/get/routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Home(),
      binding: HomeBinding()
    ),
  ];
}
