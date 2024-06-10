import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/responses/base_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
final class ProfileResponse extends BaseResponse<ProfileDataResponse> {
  const ProfileResponse({
    required super.status,
    required super.message,
    required super.success,
    required super.data,
  });

  //from json
  factory ProfileResponse.fromJson(Json json) =>
      _$ProfileResponseFromJson(json);

  //to json
  Json toJson() => _$ProfileResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}

@JsonSerializable()
final class ProfileDataResponse extends Equatable {
  final String? id;
  final String? userName;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? photoUrl;
  final int? gender;
  final int? points;
  final String? birthdate;

  final List<FollowItemResponse?>? followers;
  final List<FollowItemResponse?>? following;

  const ProfileDataResponse({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.photoUrl,
    required this.gender,
    required this.points,
    required this.birthdate,
    required this.followers,
    required this.following,
  });

  //from json
  factory ProfileDataResponse.fromJson(Json json) =>
      _$ProfileDataResponseFromJson(json);

  //to json
  Json toJson() => _$ProfileDataResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        userName,
        fullName,
        phoneNumber,
        email,
        photoUrl,
        gender,
        points,
        birthdate,
        followers,
        following,
      ];
}

@JsonSerializable()
final class FollowItemResponse extends Equatable {
  final String? id;
  final String? userName;
  final String? name;
  final String? photoUrl;

  const FollowItemResponse(
      {required this.id,
      required this.userName,
      required this.name,
      required this.photoUrl});

  //from json
  factory FollowItemResponse.fromJson(Json json) =>
      _$FollowItemResponseFromJson(json);

  //to json
  Json toJson() => _$FollowItemResponseToJson(this);

  @override
  List<Object?> get props => [id, userName, name, photoUrl];
}

@JsonSerializable()
final class PassengerItemModel extends Equatable {
  final String? id;
  final String? userName;
  final String? fullName;
  final String? photoUrl;

  const PassengerItemModel(
      {required this.id,
      required this.userName,
      required this.fullName,
      required this.photoUrl});

  //from json
  factory PassengerItemModel.fromJson(Json json) =>
      _$PassengerItemModelFromJson(json);

  //to json
  Json toJson() => _$PassengerItemModelToJson(this);

  @override
  List<Object?> get props => [id, userName, fullName, photoUrl];
}

@JsonSerializable()
final class PassengerItemResponse extends BaseResponse<PassengerItemModel> {
  const PassengerItemResponse({
    required super.status,
    required super.message,
    required super.success,
    required super.data,
  });

  //from json
  factory PassengerItemResponse.fromJson(Json json) =>
      _$PassengerItemResponseFromJson(json);

  //to json
  Json toJson() => _$PassengerItemResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}
