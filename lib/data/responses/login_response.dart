import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/responses/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "results")
  final LoginResult? result;

  const LoginResponse({
    super.status,
    super.message,
    super.success,
    this.result,
  });

  //from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        result,
      ];
}

@JsonSerializable()
class LoginResult extends Equatable {
  @JsonKey(name: "isAuthenticated")
  final bool? isAuthenticated;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phoneNumber")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "expiresOn")
  final String? expiresOn;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;
  @JsonKey(name: "refreshTokenExpiresOn")
  final String? refreshTokenExpiresOn;

  const LoginResult({
    this.isAuthenticated,
    this.email,
    this.phone,
    this.role,
    this.expiresOn,
    this.token,
    this.refreshToken,
    this.refreshTokenExpiresOn,
  });

  //from json
  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginResultToJson(this);

  @override
  List<Object?> get props => [
        isAuthenticated,
        email,
        phone,
        role,
        expiresOn,
        token,
        refreshToken,
        refreshTokenExpiresOn,
      ];
}
