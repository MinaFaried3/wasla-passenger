import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';

extension CheckUsernameResponseMapper on CheckUsernameResponse? {
  CheckUsernameModel toDomain() => CheckUsernameModel(
        valid: this?.data?.valid.orFalse() ?? false,
        message: this?.data?.message.orEmpty() ?? AppConstants.emptyString,
      );
}
