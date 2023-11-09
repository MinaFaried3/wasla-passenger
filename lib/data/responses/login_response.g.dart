// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['httpStatusCode'] as int?,
      message: json['errorMessage'] as String?,
      success: json['isSuccess'] as bool?,
      result: json['results'] == null
          ? null
          : LoginResult.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'httpStatusCode': instance.status,
      'errorMessage': instance.message,
      'isSuccess': instance.success,
      'results': instance.result,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      isAuthenticated: json['isAuthenticated'] as bool?,
      email: json['email'] as String?,
      phone: json['phoneNumber'] as String?,
      role: json['role'] as String?,
      expiresOn: json['expiresOn'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiresOn: json['refreshTokenExpiresOn'] as String?,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'isAuthenticated': instance.isAuthenticated,
      'email': instance.email,
      'phoneNumber': instance.phone,
      'role': instance.role,
      'expiresOn': instance.expiresOn,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresOn': instance.refreshTokenExpiresOn,
    };
