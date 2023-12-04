import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/repositories/base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequestBody loginRequestBody);

  const AuthRepository();
}
