import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/repositories/base_repository.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';

abstract class AuthRepository extends BaseRepository {
  ///login
  Future<Either<Failure, LoginModel>> login(LoginRequestBody loginRequestBody);

  ///register
  Future<Either<Failure, CheckUsernameModel>> checkUsername(String username);

  const AuthRepository();
}
