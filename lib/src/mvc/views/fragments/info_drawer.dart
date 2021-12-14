import 'package:asadamatic/src/mvc/controllers/drawer_controller.dart';
import 'package:asadamatic/src/widgets/os_logo_icon.dart';
import 'package:asadamatic/src/widgets/social_logo_icon.dart';
import 'package:asadamatic/src/widgets/social_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDrawer extends StatelessWidget {
  InfoDrawer({Key? key}) : super(key: key);

  final InfoDrawerController _drawerController =
      Get.put(InfoDrawerController());
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
                      animation: _drawerController.animationController!,
                      builder: (BuildContext tweenContext, Widget? child) {
                        return Text(
                          'Asad',
                          style: TextStyle(
                              letterSpacing:
                                  _drawerController.animationController!.value *
                                      50,
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
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/37589169?v=4'),
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Positioned(
                  right: 30.0,
                  bottom: 30.0,
                  child: AnimatedBuilder(
                      animation: _drawerController.animationController!,
                      builder: (BuildContext tweenContext, Widget? child) {
                        return Text(
                          'Hameed',
                          style: TextStyle(
                              textBaseline: TextBaseline.alphabetic,
                              letterSpacing:
                                  _drawerController.animationController!.value *
                                      50,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize),
                        );
                      }),
                ),
              ],
            ),
            SocialPalette(),
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
