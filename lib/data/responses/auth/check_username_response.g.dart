// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_username_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUsernameResponse _$CheckUsernameResponseFromJson(
        Map<String, dynamic> json) =>
    CheckUsernameResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] == null
          ? null
          : CheckUsernameData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckUsernameResponseToJson(
        CheckUsernameResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };

CheckUsernameData _$CheckUsernameDataFromJson(Map<String, dynamic> json) =>
    CheckUsernameData(
      valid: json['valid'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CheckUsernameDataToJson(CheckUsernameData instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'message': instance.message,
    };
