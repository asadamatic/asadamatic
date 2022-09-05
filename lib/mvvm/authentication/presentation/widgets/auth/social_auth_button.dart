import 'package:asadamatic/mvvm/authentication/enums/enums.dart';
import 'package:asadamatic/mvvm/authentication/presentation/get/o_auth_controller.dart';
import 'package:asadamatic/mvvm/authentication/styles/chat_styles.dart';
import 'package:flutter/material.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
import 'package:get/get.dart';

class SocialAuthButton extends StatelessWidget {
  final String imagePath;
  final AuthType authType;
  const SocialAuthButton(
      {required this.imagePath, required this.authType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OAuthController>(
        id: authType.toString(),
        builder: (_authController) {
          return Container(
            margin: ChatStyles.oAuthButtonMargins,
            alignment: Alignment.center,
            decoration: AppStyles.buttonDecoration,
            height: ChatStyles.oAuthButtonSize,
            width: ChatStyles.oAuthButtonSize,
            child: InkWell(
              onTap: () async {
                if (authType == AuthType.google) {
                  await _authController.googleSignIn();
                }else{
                  await _authController.facebookSignIn();
                }
              },
              child: Image.asset(
                      imagePath,
                      width: ChatStyles.oAuthIconSize,
                      height: ChatStyles.oAuthIconSize,
                    ),
            ),
          );
        });
  }
}

///The app is requesting access to sensitive info in your Google Account. Until the developer (asadamatic@gmail.com) verifies this app with Google, you shouldn't use it.