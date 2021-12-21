import 'package:asadamatic/src/config/routes/app_pages.dart';
import 'package:asadamatic/src/config/routes/routes.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:asadamatic/src/mvc/controllers/theme_controller.dart'
    show ThemeController;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  //
  // final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      title: 'Asad Hameed',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(color: Colors.white),
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
