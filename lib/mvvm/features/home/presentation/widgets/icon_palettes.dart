import 'package:asadamatic/mvvm/core/constants/values.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/social_logo_icon.dart';
import 'package:flutter/material.dart';

class SocialPalette extends StatelessWidget {
  const SocialPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: HomeConstants.socialIcons
          .map((socialIcon) => SocialLogoIcon(
                asset: socialIcon[0],
                index: HomeConstants.socialIcons.indexOf(socialIcon),
                url: socialIcon[1],
              ))
          .toList(),
    );
  }
}
