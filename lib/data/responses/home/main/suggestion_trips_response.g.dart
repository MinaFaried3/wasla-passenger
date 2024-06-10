// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_trips_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionTripsResponse _$SuggestionTripsResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestionTripsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SuggestionTripModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestionTripsResponseToJson(
        SuggestionTripsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };
