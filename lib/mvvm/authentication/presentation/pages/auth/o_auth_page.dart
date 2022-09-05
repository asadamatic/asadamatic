import 'package:asadamatic/mvvm/authentication/constants/constants.dart';
import 'package:asadamatic/mvvm/authentication/enums/enums.dart';
import 'package:asadamatic/mvvm/authentication/presentation/get/o_auth_controller.dart';
import 'package:asadamatic/mvvm/authentication/presentation/widgets/auth/social_auth_button.dart';
import 'package:asadamatic/mvvm/authentication/styles/chat_styles.dart';
import 'package:asadamatic/mvvm/core/constants/assets.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
import 'package:asadamatic/mvvm/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OAuthPage extends StatelessWidget {
  const OAuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final OAuthController _authController = Get.put(OAuthController());
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text(ChatConstants.oAuthPagePrompt),
            SizedBox(
              width: ChatStyles.oAuthIconTrayWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AppAssets.authTypes
                    .map(
                      (authType) => SocialAuthButton(
                        imagePath: authType == AuthType.facebook ? AppAssets.facebookIcon : AppAssets.googleIcon,
                        authType: authType,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
