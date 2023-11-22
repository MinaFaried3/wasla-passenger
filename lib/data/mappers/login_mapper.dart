import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/login_response.dart';
import 'package:wasla/domain/entities/login_models/login_model.dart';

//record to domain

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      isAuthenticated: this?.result?.isAuthenticated.orFalse() ?? false,
      email: this?.result?.email.orEmpty() ?? AppConstants.emptyString,
      phone: this?.result?.phone.orEmpty() ?? AppConstants.emptyString,
      role: this?.result?.role.orEmpty() ?? AppConstants.emptyString,
      expiresOn: this?.result?.expiresOn.orEmpty() ?? AppConstants.emptyString,
      token: this?.result?.token.orEmpty() ?? AppConstants.emptyString,
      refreshToken:
          this?.result?.refreshToken.orEmpty() ?? AppConstants.emptyString,
      refreshTokenExpiresOn: this?.result?.refreshTokenExpiresOn.orEmpty() ??
          AppConstants.emptyString,
    );
  }
}
