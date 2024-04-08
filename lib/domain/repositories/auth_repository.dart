import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/repositories/base_repository.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';

abstract class AuthRepository extends BaseRepository {
  ///login
  FailureOrPassengerModel login(LoginRequestBody loginRequestBody);

  ///register
  FailureOrPassengerModel register(RegisterRequestBody registerRequestBody);

  FailureOr<CheckUsernameModel> checkUsername(String username);

  ///verification
  FailureOrBaseModel editEmail(String email);

  FailureOrBaseModel editPhone(String phone);

  const AuthRepository();
}
