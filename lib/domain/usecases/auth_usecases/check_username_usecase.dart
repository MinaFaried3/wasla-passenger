import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class CheckUsernameUseCase extends ParameterizedBaseUseCase<String,
    CheckUsernameModel, AuthRepository> {
  const CheckUsernameUseCase({required super.repository});

  @override
  Future<Either<Failure, CheckUsernameModel>> call(String input) async {
    return await repository.checkUsername(input);
  }
}
