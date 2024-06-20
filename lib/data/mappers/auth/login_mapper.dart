import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/app/shared/enums/gender.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/domain/entities/auth/passenger_model.dart';

//record to domain
extension ConnectionDataResponseMapper on ConnectionsDataResponse? {
  Connections toDomain() => Connections(
        email: this?.email.orEmpty() ?? AppConstants.emptyString,
        phone: this?.phone.orEmpty() ?? AppConstants.emptyString,
        emailConfirmed: this?.emailConfirmed.orFalse() ?? false,
        phoneConfirmed: this?.phoneConfirmed.orFalse() ?? false,
      );
}

extension TokensDataResponseMapper on TokensDataResponse? {
  Tokens toDomain() => Tokens(
        token: this?.token.orEmpty() ?? AppConstants.emptyString,
        tokenExpiryDate:
            this?.tokenExpiryDate.orEmpty() ?? AppConstants.emptyString,
        refreshToken: this?.refreshToken.orEmpty() ?? AppConstants.emptyString,
        refTokenExpiryDate:
            this?.refTokenExpiryDate.orEmpty() ?? AppConstants.emptyString,
      );
}

extension AuthResponseMapper on AuthResponse? {
  PassengerModel toDomain() {
    return PassengerModel(
      isAuthenticated: this?.data?.isAuthenticated.orFalse() ?? false,
      connections:
          this?.data?.connectionsData.toDomain() ?? Connections.empty(),
      tokens: this?.data?.tokensData.toDomain() ?? Tokens.empty(),
      role: this?.data?.role.orEmpty() ?? AppConstants.emptyString,
      firstName: this?.data?.firstName.orEmpty() ?? AppConstants.emptyString,
      lastName: this?.data?.lastName.orEmpty() ?? AppConstants.emptyString,
      points: this?.data?.points.orZero() ?? AppConstants.zero,
      profile: this?.data?.profile.orEmpty() ?? AppConstants.emptyString,
      userName: this?.data?.userName.orEmpty() ?? AppConstants.emptyString,
      userId: this?.data?.userId.orEmpty() ?? AppConstants.emptyString,
      gender: Gender.male.name,
      birthdate: AppConstants.emptyString,
    );
  }
}
