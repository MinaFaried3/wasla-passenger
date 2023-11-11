import 'package:wasla/app/shared/common/common_libs.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequestBody loginRequestBody);

  const AuthRepository();
}
