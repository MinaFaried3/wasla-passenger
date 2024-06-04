// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseWithOutData _$BaseResponseWithOutDataFromJson(
        Map<String, dynamic> json) =>
    BaseResponseWithOutData(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'],
    );

Map<String, dynamic> _$BaseResponseWithOutDataToJson(
        BaseResponseWithOutData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };

BaseResponseWithStringData _$BaseResponseWithStringDataFromJson(
        Map<String, dynamic> json) =>
    BaseResponseWithStringData(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$BaseResponseWithStringDataToJson(
        BaseResponseWithStringData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };
