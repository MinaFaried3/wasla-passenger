import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

class EditEmailUseCase
    extends ParameterizedBaseUseCase<String, BaseModel, AuthRepository> {
  const EditEmailUseCase({required super.repository});

  @override
  FailureOr<BaseModel> call(String input) async {
    return await repository.editEmail(input);
  }
}

class EditPhoneUseCase
    extends ParameterizedBaseUseCase<String, BaseModel, AuthRepository> {
  const EditPhoneUseCase({required super.repository});

  @override
  FailureOr<BaseModel> call(String input) async {
    return await repository.editPhone(input);
  }
}
