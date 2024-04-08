import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/responses/base_response.dart';

part 'auth_response.g.dart';

@JsonSerializable()
final class AuthResponse extends BaseResponse<AuthData> {
  const AuthResponse({
    super.status,
    super.message,
    super.success,
    super.data,
  });

  //from json
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}

@JsonSerializable()
class AuthData extends Equatable {
  @JsonKey(name: "points")
  final int? points;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "photoUrl")
  final String? profile;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "isAuthenticated")
  final bool? isAuthenticated;
  @JsonKey(name: "connectionData")
  final ConnectionsDataResponse? connectionsData;
  @JsonKey(name: "tokensData")
  final TokensDataResponse? tokensData;
  @JsonKey(name: "role")
  final String? role;

  const AuthData({
    this.points,
    this.firstName,
    this.lastName,
    this.userName,
    this.profile,
    this.isAuthenticated,
    this.connectionsData,
    this.tokensData,
    this.role,
  });

  //from json
  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);

  @override
  List<Object?> get props => [
        points,
        firstName,
        lastName,
        userName,
        profile,
        isAuthenticated,
        connectionsData,
        tokensData,
        role,
      ];
}

@JsonSerializable()
final class ConnectionsDataResponse extends Equatable {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  final bool? emailConfirmed;
  final bool? phoneConfirmed;

  const ConnectionsDataResponse({
    this.email,
    this.phone,
    this.emailConfirmed,
    this.phoneConfirmed,
  });

  //from json
  factory ConnectionsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ConnectionsDataResponseToJson(this);

  @override
  List<Object?> get props => [
        email,
        phone,
        emailConfirmed,
        phoneConfirmed,
      ];
}

@JsonSerializable()
final class TokensDataResponse extends Equatable {
  //todo convert to date time

  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "tokenExpiryDate")
  final String? tokenExpiryDate;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;
  @JsonKey(name: "refTokenExpiryDate")
  final String? refTokenExpiryDate;

  const TokensDataResponse({
    this.token,
    this.tokenExpiryDate,
    this.refreshToken,
    this.refTokenExpiryDate,
  });

  //from json
  factory TokensDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TokensDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$TokensDataResponseToJson(this);

  @override
  List<Object?> get props => [
        token,
        tokenExpiryDate,
        refreshToken,
        refTokenExpiryDate,
      ];
}
