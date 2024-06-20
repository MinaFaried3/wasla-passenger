import 'dart:io';

import 'package:wasla/app/shared/common/common_libs.dart';

final class EditProfileRequest extends Equatable {
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String phone;
  final String birthdate;
  final String gender;
  final File? profileImage;

  const EditProfileRequest(
      {required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.phone,
      required this.birthdate,
      required this.gender,
      required this.profileImage});

  EditProfileRequest copyWith({
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? phone,
    String? birthdate,
    String? gender,
    File? profileImage,
  }) {
    return EditProfileRequest(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        username,
        email,
        phone,
        birthdate,
        gender,
        profileImage,
      ];
}
