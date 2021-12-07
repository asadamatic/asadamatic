import 'package:asadamatic/src/config/routes/routes.dart';
import 'package:asadamatic/src/mvc/views/home.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => Home(),
    ),
  ];
}
