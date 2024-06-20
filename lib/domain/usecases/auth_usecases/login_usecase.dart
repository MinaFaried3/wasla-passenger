import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class LoginUseCase extends ParameterizedBaseUseCase<LoginRequestBody,
    PassengerModel, AuthRepository> {
  const LoginUseCase({required super.repository});

  @override
  Future<Either<Failure, PassengerModel>> call(LoginRequestBody input) async {
    return await repository.login(input);
  }
}
