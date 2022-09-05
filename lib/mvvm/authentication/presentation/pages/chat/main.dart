import 'package:asadamatic/mvvm/authentication/presentation/pages/auth/auth_wrapper.dart';
import 'package:asadamatic/mvvm/core/get/controllers/theme_controller.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: _themeController.themeMode!,
        darkTheme: AppStyles.darkTheme,
        theme: AppStyles.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper());
  }
}
