import 'package:asadamatic/mvvm/authentication/constants/constants.dart';
import 'package:asadamatic/mvvm/authentication/enums/enums.dart';
import 'package:asadamatic/mvvm/authentication/presentation/get/o_auth_controller.dart';
import 'package:asadamatic/mvvm/authentication/presentation/pages/auth/o_auth_page.dart';
import 'package:asadamatic/mvvm/authentication/presentation/pages/auth/sign_in_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<OAuthController>(() => OAuthController());
    return GetBuilder<OAuthController>(
        id: ChatConstants.getIdAuthWrapper,
        builder: (_authController) {
          if (_authController.authState == AuthState.signedIn) {
            return const Center(
              child: Text('Chat Screen'),
            );
          } else if (_authController.authState == AuthState.signedOut) {
            return const OAuthPage();
          }

          return const SignInLoadingPage();
        });
  }
}
