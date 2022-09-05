import 'package:asadamatic/mvvm/authentication/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel(
      {required String userId, required String email, required String name, required String photoUrl})
      : super(userId: userId, email: email, name: name, photoUrl: photoUrl);

  factory UserModel.fromUserCredential(UserCredential userCredential) {
    return UserModel(
      userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
        photoUrl: userCredential.user!.photoURL!);
  }
}
