import 'package:asadamatic/src/config/routes/app_pages.dart';
import 'package:asadamatic/src/config/routes/routes.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:asadamatic/src/widgets/value_ticker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      title: AppConstants.appTitle,
      themeMode: ThemeMode.system,
      darkTheme: AppStyles.darkTheme,
      theme: AppStyles.lightTheme,
    );
  }
}
