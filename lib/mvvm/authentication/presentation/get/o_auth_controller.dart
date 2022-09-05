import 'package:asadamatic/mvvm/authentication/constants/constants.dart';
import 'package:asadamatic/mvvm/authentication/data/repository/facebook_o_auth_impl.dart';
import 'package:asadamatic/mvvm/authentication/data/repository/google_o_auth_impl.dart';
import 'package:asadamatic/mvvm/authentication/domain/use_cases/sign_in_with_google.dart';
import 'package:asadamatic/mvvm/authentication/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OAuthController extends GetxController {
  AuthState authState = AuthState.signedOut;
  GoogleOAuthImpl googleOAuthImpl = GoogleOAuthImpl();
  FacebookOAuthImpl facebookOAuthImpl = FacebookOAuthImpl();
  late SignInWithOAuth signInWithGoogle;
  late SignInWithOAuth signInWithFacebook;

  @override
  onInit() {
    signInWithGoogle = SignInWithOAuth(googleOAuthImpl);
    signInWithFacebook = SignInWithOAuth(facebookOAuthImpl);

    super.onInit();
  }

  googleSignIn() async {
    authState = AuthState.signingIn;
    update([ChatConstants.getIdAuthWrapper]);
    await signInWithGoogle().then((value) {
      authState = AuthState.signedIn;
    }, onError: (error) {
      authState = AuthState.signedOut;
    });
    update([ChatConstants.getIdAuthWrapper]);
  }

  facebookSignIn() async {
    authState = AuthState.signingIn;
    update([ChatConstants.getIdAuthWrapper]);
    await signInWithFacebook().then((value) {
      authState = AuthState.signedIn;
    }, onError: (error) {
      authState = AuthState.signedOut;
    });
    update([ChatConstants.getIdAuthWrapper]);
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
