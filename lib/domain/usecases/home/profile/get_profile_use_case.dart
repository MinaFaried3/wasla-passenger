import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class GetProfileUseCase
    extends ParameterizedBaseUseCase<void, ProfileModel, AuthRepository> {
  const GetProfileUseCase({required super.repository});

  @override
  FailureOr<ProfileModel> call(void input) async {
    return await repository.getProfile();
  }
}
