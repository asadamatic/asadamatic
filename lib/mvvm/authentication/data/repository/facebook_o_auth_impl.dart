

import 'package:asadamatic/mvvm/authentication/data/models/user_model.dart';
import 'package:asadamatic/mvvm/authentication/domain/repositories/o_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookOAuthImpl implements OAuthRepository{


  @override
  Future<UserModel> singIn() async{
      // Create a new provider
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      // Once signed in, return the UserCredential
      final userCredentials =
      await FirebaseAuth.instance.signInWithPopup(facebookProvider);
      return UserModel.fromUserCredential(userCredentials);
      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }
}