import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

class LoginUseCase
    extends BaseUseCase<LoginRequestBody, LoginModel, AuthRepository> {
  const LoginUseCase({required super.repository});

  @override
  Future<Either<Failure, LoginModel>> call(LoginRequestBody input) async {
    return await repository.login(input);
  }
}
