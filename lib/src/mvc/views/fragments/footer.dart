import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/home.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(mediumSpacing),
      child: Column(
        children: [
          Divider(
            height: massiveSpacing,
          ),
          GetBuilder<HomeController>(
              id: 'packageInfo',
              builder: (controller) {
                return Text(
                  'Made with Flutter - Version ${controller.packageInfo!.version}',
                );
              }),
        ],
      ),
    );
  }
}
