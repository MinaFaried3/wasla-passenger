// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      points: json['points'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      profile: json['photoUrl'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool?,
      connectionsData: json['connectionData'] == null
          ? null
          : ConnectionsDataResponse.fromJson(
              json['connectionData'] as Map<String, dynamic>),
      tokensData: json['tokensData'] == null
          ? null
          : TokensDataResponse.fromJson(
              json['tokensData'] as Map<String, dynamic>),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'points': instance.points,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.profile,
      'userName': instance.userName,
      'isAuthenticated': instance.isAuthenticated,
      'connectionData': instance.connectionsData,
      'tokensData': instance.tokensData,
      'role': instance.role,
    };

ConnectionsDataResponse _$ConnectionsDataResponseFromJson(
        Map<String, dynamic> json) =>
    ConnectionsDataResponse(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ConnectionsDataResponseToJson(
        ConnectionsDataResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };

TokensDataResponse _$TokensDataResponseFromJson(Map<String, dynamic> json) =>
    TokensDataResponse(
      token: json['token'] as String?,
      tokenExpiryDate: json['tokenExpiryDate'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refTokenExpiryDate: json['refTokenExpiryDate'] as String?,
    );

Map<String, dynamic> _$TokensDataResponseToJson(TokensDataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenExpiryDate': instance.tokenExpiryDate,
      'refreshToken': instance.refreshToken,
      'refTokenExpiryDate': instance.refTokenExpiryDate,
    };
