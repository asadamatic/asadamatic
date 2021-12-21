import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLogoIcon extends StatelessWidget {
  AppLogoIcon({this.asset, this.index, this.package, Key? key})
      : super(key: key);
  final int? index;
  final String? asset;
  final String? package;

  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SliderController>(
      id: package,
        builder: (_sliderController) {
          final isCurrentSelected = index ==
              _sliderController.index.value;
          return
            Container(
              padding: EdgeInsets.all(8.0 - _sliderController.increasedHeight),
              child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    _sliderController.onPageChanged(index);
                  },
                  onHover: (value) {
                    if (! isCurrentSelected && index ==
                        appLogoIcons
                            .indexWhere((appLogoIcon) => appLogoIcon[1] == package!)) {
                      if (value) {
                        _sliderController.onHover(package);
                      } else {
                        _sliderController.onHoverRemoved(package);
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Image(
                        height: _sliderController.height,
                        image: AssetImage(asset ?? 'Assets/icon.png',
                            package: package),
                      ),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin:
                          const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 6.0),
                          width: 20.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                              color: isCurrentSelected ? Colors.white : null,
                              borderRadius: BorderRadius.circular(10.0)))
                    ],
                  )
              ),
            );
        }
    );
  }
}
