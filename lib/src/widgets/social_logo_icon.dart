import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/models/social_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLogoIcon extends StatefulWidget {
  const SocialLogoIcon(
      {Key? key, required this.socialLink})
      : super(key: key);
  final SocialLink socialLink;

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
        onTap: () async =>
            await launchUrl(Uri.parse(widget.socialLink.profileUrl)),
        onHover: (value) {
          if (value) {
            onHover();
          } else {
            onHoverRemoved();
          }
        },
        child: GetBuilder<ThemeController>(builder: (_themeController) {
          return Image(
            height: height,
            color: widget.socialLink.imageAsset == 'assets/github.png'
                ? _themeController.themeMode == ThemeMode.dark
                    ? Colors.white
                    : null
                : null,
            image: AssetImage(
                widget.socialLink.imageAsset ?? 'assets/stack-overflow.png'),
          );
        }),
      ),
    );
  }
}
