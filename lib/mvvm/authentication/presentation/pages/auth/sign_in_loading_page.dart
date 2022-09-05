import 'package:asadamatic/mvvm/authentication/constants/constants.dart';
import 'package:flutter/material.dart';

class SignInLoadingPage extends StatelessWidget {
  const SignInLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const[
            CircularProgressIndicator(),
            SizedBox(height: 15.0,),
            Text(ChatConstants.signingInLoadingMessage)
          ],
        ),
      ),
    );
  }
}
