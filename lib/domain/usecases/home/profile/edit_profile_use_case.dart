import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/requests/home/profile/edit_profile_request.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class EditProfileUseCase extends ParameterizedBaseUseCase<
    EditProfileRequest, BaseModel, AuthRepository> {
  EditProfileUseCase({required super.repository});

  @override
  FailureOr<BaseModel> call(EditProfileRequest input) async {
    return await repository.editProfile(editProfileRequest: input);
  }
}
