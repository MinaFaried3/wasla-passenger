// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] == null
          ? null
          : ProfileDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      gender: json['gender'] as int?,
      points: json['points'] as int?,
      birthdate: json['birthdate'] as String?,
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FollowItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FollowItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'points': instance.points,
      'birthdate': instance.birthdate,
      'followers': instance.followers,
      'following': instance.following,
    };

FollowItemResponse _$FollowItemResponseFromJson(Map<String, dynamic> json) =>
    FollowItemResponse(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$FollowItemResponseToJson(FollowItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };

PassengerItemModel _$PassengerItemModelFromJson(Map<String, dynamic> json) =>
    PassengerItemModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$PassengerItemModelToJson(PassengerItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'photoUrl': instance.photoUrl,
    };

PassengerItemResponse _$PassengerItemResponseFromJson(
        Map<String, dynamic> json) =>
    PassengerItemResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      success: json['isSuccess'] as bool?,
      data: json['data'] == null
          ? null
          : PassengerItemModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PassengerItemResponseToJson(
        PassengerItemResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'isSuccess': instance.success,
      'data': instance.data,
    };
