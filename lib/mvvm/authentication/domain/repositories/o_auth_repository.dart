import 'package:asadamatic/mvvm/authentication/domain/entities/user.dart';

abstract class OAuthRepository {
  Future<UserEntity> singIn();
}