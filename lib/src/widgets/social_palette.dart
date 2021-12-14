import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/widgets/social_logo_icon.dart';
import 'package:flutter/material.dart';

class SocialPalette extends StatelessWidget {
  const SocialPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialIcons
          .map((socialIcon) => SocialLogoIcon(
                asset: socialIcon[0],
                index: socialIcons.indexOf(socialIcon),
                url: socialIcon[1],
              ))
          .toList(),
    );
  }
}
