import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (_themeController) {
      return Container(
        height: 55.0,
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0)
        ),
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: _themeController.isThemeDark ? 3.0 : 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.0),

                  onTap: _themeController.toggleTheme,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text('Dark'),
                  ),
                ),
              ),
              Card(
                elevation: _themeController.isThemeDark ? 0.0 : 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: _themeController.toggleTheme,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text('Light'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
