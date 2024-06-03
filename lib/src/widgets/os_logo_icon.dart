import 'package:asadamatic/src/enums.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OsLogoIcon extends StatelessWidget {
  OsLogoIcon({required this.os, Key? key}) : super(key: key);

  final Os os;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mediumSpacing),
      child: Center(
        child: Icon(
          os.icon,
          size: 30,
        ),
      ),
    );
  }
}
