import 'package:wasla/app/shared/enums/gender.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';

extension ProfileResponseMapper on ProfileResponse? {
  ProfileModel toDomain() {
    return ProfileModel(
      id: this?.data?.id.orEmpty() ?? '',
      userName: this?.data?.userName.orEmpty() ?? '',
      fullName: this?.data?.fullName.orEmpty() ?? '',
      phoneNumber: this?.data?.phoneNumber.orEmpty() ?? '',
      email: this?.data?.email.orEmpty() ?? '',
      photoUrl: this?.data?.photoUrl.orEmpty() ?? '',
      gender: genderMapper(),
      points: this?.data?.points.orZero() ?? 0,
      birthdate: this?.data?.birthdate.orEmpty() ?? '',
      followers: this
              ?.data
              ?.followers
              ?.map((e) =>
                  e?.toDomain() ??
                  const UserTileModel(
                      id: '', userName: '', name: '', photoUrl: ''))
              .toList() ??
          [],
      following: this
              ?.data
              ?.following
              ?.map((e) =>
                  e?.toDomain() ??
                  const UserTileModel(
                      id: '', userName: '', name: '', photoUrl: ''))
              .toList() ??
          [],
    );
  }

  Gender genderMapper() {
    int gender = this?.data?.gender ?? 0;
    return switch (gender) {
      0 => Gender.male,
      1 => Gender.female,
      _ => Gender.male
    };
  }
}

extension FollowItemResponseMapper on FollowItemResponse? {
  UserTileModel toDomain() {
    return UserTileModel(
      id: this?.id.orEmpty() ?? '',
      userName: this?.userName.orEmpty() ?? '',
      name: this?.name.orEmpty() ?? '',
      photoUrl: this?.photoUrl.orEmpty() ?? '',
    );
  }
}
