// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestBody _$LoginRequestBodyFromJson(Map<String, dynamic> json) =>
    LoginRequestBody(
      userName: json['userName'] as String,
      password: json['password'] as String,
      role: json['role'] as String? ?? AppConstants.role,
    );

Map<String, dynamic> _$LoginRequestBodyToJson(LoginRequestBody instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'role': instance.role,
    };
