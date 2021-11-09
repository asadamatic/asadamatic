import 'package:asadamatic/lib/src/config/routes/routes.dart';
import 'package:asadamatic/lib/src/mvc/views/home.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
  ];
}
