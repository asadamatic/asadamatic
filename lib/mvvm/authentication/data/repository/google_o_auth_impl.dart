import 'package:asadamatic/mvvm/authentication/data/models/user_model.dart';
import 'package:asadamatic/mvvm/authentication/domain/repositories/o_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleOAuthImpl implements OAuthRepository {
  @override
  Future<UserModel> singIn() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    // Once signed in, return the UserCredential
    final userCredentials =
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
    return UserModel.fromUserCredential(userCredentials);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
}
