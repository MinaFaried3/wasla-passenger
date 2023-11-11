import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/login_response.dart';
import 'package:wasla/domain/entities/login_models/login_model.dart';

//record to domain

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      isAuthenticated: this?.result?.isAuthenticated.orFalse() ?? false,
      email: this?.result?.email.orEmpty() ?? emptyString,
      phone: this?.result?.phone.orEmpty() ?? emptyString,
      role: this?.result?.role.orEmpty() ?? emptyString,
      expiresOn: this?.result?.expiresOn.orEmpty() ?? emptyString,
      token: this?.result?.token.orEmpty() ?? emptyString,
      refreshToken: this?.result?.refreshToken.orEmpty() ?? emptyString,
      refreshTokenExpiresOn:
          this?.result?.refreshTokenExpiresOn.orEmpty() ?? emptyString,
    );
  }
}
