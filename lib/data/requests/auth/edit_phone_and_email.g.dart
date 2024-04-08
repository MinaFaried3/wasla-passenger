// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_phone_and_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPhoneRequestBody _$EditPhoneRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditPhoneRequestBody(
      refreshToken: json['reftoken'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$EditPhoneRequestBodyToJson(
        EditPhoneRequestBody instance) =>
    <String, dynamic>{
      'reftoken': instance.refreshToken,
      'phone': instance.phone,
    };

EditEmailRequestBody _$EditEmailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditEmailRequestBody(
      refreshToken: json['reftoken'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$EditEmailRequestBodyToJson(
        EditEmailRequestBody instance) =>
    <String, dynamic>{
      'reftoken': instance.refreshToken,
      'email': instance.email,
    };
