import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLogoIcon extends StatefulWidget {
  const SocialLogoIcon({this.asset, this.index, this.url, Key? key})
      : super(key: key);
  final int? index;
  final String? asset;
  final String? url;
  @override
  State<SocialLogoIcon> createState() => _SocialLogoIconState();
}

class _SocialLogoIconState extends State<SocialLogoIcon> {


  double height = 25.0;
  double increasedHeight = 0.0;
  onHover() {
    setState(() {
      height = 30.0;
      increasedHeight = 2.5;
    });
  }

  onHoverRemoved() {
    setState(() {
      height = 25.0;
      increasedHeight = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0 - increasedHeight),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () async {
          await launch(widget.url!);
        },
        onHover: (value) {
          if (widget.index ==
              socialIcons
                  .indexWhere((socialIcon) => socialIcon[0] == widget.asset!)) {
            if (value) {
              onHover();
            } else {
              onHoverRemoved();
            }
          }
        },
        child: GetBuilder<ThemeController>(
          builder: (_themeController) {
            return Image(
              height: height,
              color: widget.asset == 'assets/github.png'
                  ? _themeController.themeMode == ThemeMode.dark
                      ? Colors.white
                      : null
                  : null,
              image: AssetImage(widget.asset ?? 'assets/stack-overflow.png'),
            );
          }
        ),
      ),
    );
  }
}
