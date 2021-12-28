import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/widgets/icon_palettes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDrawer extends StatelessWidget {
  InfoDrawer({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 210.0,
                ),
                Positioned(
                  left: 0.0,
                  top: -20.0,
                  child: AnimatedBuilder(
                      animation: _homeController.nameAnimationController!,
                      builder: (BuildContext tweenContext, Widget? child) {
                        return Text(
                          'Asad',
                          style: TextStyle(
                              letterSpacing: 50 *
                                  _homeController
                                      .nameAnimationController!.value,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .fontSize),
                        );
                      }),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/me.png'),
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Positioned(
                  right: 30.0,
                  bottom: 30.0,
                  child: AnimatedBuilder(
                      animation: _homeController.nameAnimationController!,
                      builder: (BuildContext tweenContext, Widget? child) {
                        return Text(
                          'Hameed',
                          style: TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              letterSpacing: 50 *
                                  _homeController
                                      .nameAnimationController!.value,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize),
                        );
                      }),
                ),
              ],
            ),
            const SocialPalette(),
            // Row(
            //   children: [
            //     // Icon(Icons.location_on),
            //     Text('Islamabad, Pakistan'),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //       child: Image(
            //         image: AssetImage('assets/pakistan.png'),
            //         height: 25.0,
            //         width: 25.0,
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
