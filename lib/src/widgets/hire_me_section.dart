import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HireMeSection extends StatelessWidget {
  const HireMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0))),
              textStyle: MaterialStateProperty.all(textTheme.titleMedium)),
          onPressed: _homeController.hireMe,
          child: const Text('Available for work!')),
    );
  }
}
