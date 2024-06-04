// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_email_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmEmailRequestBody _$ConfirmEmailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ConfirmEmailRequestBody(
      recOtp: json['recOtp'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ConfirmEmailRequestBodyToJson(
        ConfirmEmailRequestBody instance) =>
    <String, dynamic>{
      'recOtp': instance.recOtp,
      'email': instance.email,
    };

ConfirmPhoneRequestBody _$ConfirmPhoneRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ConfirmPhoneRequestBody(
      recOtp: json['recOtp'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ConfirmPhoneRequestBodyToJson(
        ConfirmPhoneRequestBody instance) =>
    <String, dynamic>{
      'recOtp': instance.recOtp,
      'phone': instance.phone,
    };
