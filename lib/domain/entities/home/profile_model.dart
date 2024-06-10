import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/enums/gender.dart';

final class ProfileModel extends Equatable {
  final String id;
  final String userName;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String photoUrl;
  final Gender gender;
  final int points;
  final String birthdate;

  final List<UserTileModel> followers;
  final List<UserTileModel> following;

  const ProfileModel({
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

  @override
  List<Object> get props => [
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

final class UserTileModel extends Equatable {
  final String id;
  final String userName;
  final String name;
  final String photoUrl;

  const UserTileModel(
      {required this.id,
      required this.userName,
      required this.name,
      required this.photoUrl});

  @override
  List<Object> get props => [id, userName, name, photoUrl];
}
