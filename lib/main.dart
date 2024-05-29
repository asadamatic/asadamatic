import 'package:asadamatic/navigator_custom.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  CustomNavigationHelper.instance;
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: CustomNavigationHelper.router,
            title: AppConstants.appTitle,
            themeMode: controller.themeMode,
            theme: ThemeData.from(
                useMaterial3: true,
                colorScheme: flexSchemeLight,
                textTheme:
                    const TextTheme(displayLarge: TextStyle(fontSize: 80.0))),
            darkTheme: ThemeData.from(
                useMaterial3: true,
                colorScheme: flexSchemeDark,
                textTheme:
                    const TextTheme(displayLarge: TextStyle(fontSize: 80.0))),
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 600, name: MOBILE),
                const Breakpoint(start: 601, end: 900, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
          );
        });
  }
}
