import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

class SendVerificationEmailUseCase
    extends BaseUseCase<void, BaseModel, AuthRepository> {
  SendVerificationEmailUseCase({required super.repository});

  @override
  FailureOr<BaseModel> call(input) async {
    return await repository.sendVerificationEmailToPassenger();
  }
}
