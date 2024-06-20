import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class RegisterUseCase extends ParameterizedBaseUseCase<
    RegisterRequestBody, PassengerModel, AuthRepository> {
  const RegisterUseCase({required super.repository});

  @override
  Future<Either<Failure, PassengerModel>> call(
      RegisterRequestBody input) async {
    return await repository.register(input);
  }
}
