// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
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

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
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
      emailConfirmed: json['emailConfirmed'] as bool?,
      phoneConfirmed: json['phoneConfirmed'] as bool?,
    );

Map<String, dynamic> _$ConnectionsDataResponseToJson(
        ConnectionsDataResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'emailConfirmed': instance.emailConfirmed,
      'phoneConfirmed': instance.phoneConfirmed,
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
