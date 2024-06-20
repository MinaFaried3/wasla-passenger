import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

class ConfirmEmailUseCase
    extends ParameterizedBaseUseCase<String, BaseModel, AuthRepository> {
  ConfirmEmailUseCase({required super.repository});

  @override
  FailureOr<BaseModel> call(String input) async {
    return await repository.confirmEmail(verifyCode: input);
  }
}
