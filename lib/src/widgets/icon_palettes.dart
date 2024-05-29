import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/app_data.dart';
import 'package:asadamatic/src/mvc/models/social_link.dart';
import 'package:asadamatic/src/widgets/app_logo_icon.dart';
import 'package:asadamatic/src/widgets/social_logo_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialPalette extends StatelessWidget {
  const SocialPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialLinks
          .map((link) => SocialLogoIcon(
                socialLink: link,
              ))
          .toList(),
    );
  }
}

class AppIconPalette extends StatelessWidget {
  const AppIconPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'apps',
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: controller.moveAppsBackwards,
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: PageView.builder(
                    controller: controller.appsPageController,
                    scrollDirection: Axis.horizontal,
                    // itemCount: apps.length,
                    onPageChanged: (index) =>
                        controller.onChangedApp(index % apps.length),
                    itemBuilder: (context, index) {
                      final adjustedIndex = index % apps.length;
                      final app = apps[adjustedIndex];
                      return AppLogoIcon(
                        isSelected: controller.selectedApp.value == app,
                        app: app,
                      );
                    }),
              ),
              IconButton(
                  onPressed: controller.moveAppsForwards,
                  icon: const Icon(Icons.arrow_forward_ios_outlined)),
            ],
          );
        });
  }
}
