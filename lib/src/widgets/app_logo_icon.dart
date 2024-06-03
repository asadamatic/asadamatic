import 'package:asadamatic/src/mvc/models/app_data.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';

class AppLogoIcon extends StatelessWidget {
  const AppLogoIcon({
    Key? key,
    required this.app,
    required this.isSelected,
  }) : super(key: key);
  final App app;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(mediumSpacing),
      child: Column(
        children: [
          Builder(
            builder: (context) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: borderRadius, color: Colors.amber),
                clipBehavior: Clip.hardEdge,
                child: Image(
                  image: AssetImage(app.logoAsset),
                  fit: BoxFit.contain,
                ),
              );
            }
          ),
          // GetBuilder<ThemeController>(builder: (_themeController) {
          //   final darkTheme = _themeController.themeMode == ThemeMode.dark;
          //   return AnimatedContainer(
          //       duration: const Duration(milliseconds: 600),
          //       margin: const EdgeInsets.symmetric(
          //           horizontal: 2.0, vertical: 6.0),
          //       width: hugeSpacing,
          //       height: mediumSpacing,
          //       decoration: BoxDecoration(
          //           color: isSelected
          //               ? darkTheme
          //                   ? Colors.white
          //                   : Colors.black
          //               : null,
          //           borderRadius: BorderRadius.circular(10.0)));
          // })
        ],
      ),
    );
  }
}
