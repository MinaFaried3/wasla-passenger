// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionTripModel _$SuggestionTripModelFromJson(Map<String, dynamic> json) =>
    SuggestionTripModel(
      id: json['id'] as int,
      companyName: json['comapnyName'] as String,
      companyRating: json['companyRating'] as int,
      imageUrl: json['imageUrl'] as String,
      startTime: json['startTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$SuggestionTripModelToJson(
        SuggestionTripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comapnyName': instance.companyName,
      'companyRating': instance.companyRating,
      'imageUrl': instance.imageUrl,
      'startTime': instance.startTime,
      'arrivalTime': instance.arrivalTime,
      'from': instance.from,
      'to': instance.to,
      'price': instance.price,
    };
