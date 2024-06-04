import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mediumSpacing),
      child: Column(
        children: [
          const Divider(
            height: massiveSpacing,
          ),
          GetBuilder<HomeController>(
              id: packageInfoBuilder,
              builder: (controller) {
                if (controller.packageInfo != null) {
                  return Text(
                    'Made with Flutter - Version ${controller.packageInfo!.version}',
                  );
                }
                return SizedBox();
              }),
        ],
      ),
    );
  }
}
