import 'package:asadamatic/mvvm/authentication/domain/entities/user.dart';
import 'package:asadamatic/mvvm/authentication/domain/repositories/o_auth_repository.dart';

class SignInWithOAuth {
  final OAuthRepository _authRepository;

  SignInWithOAuth(this._authRepository);

  Future<UserEntity> call() {
    return _authRepository.singIn();
  }
}
