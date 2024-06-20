part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.loading() = _loading;

  const factory EditProfileState.editProfileSuccess() = _editProfileSuccess;

  const factory EditProfileState.editProfileFailure({required String message}) =
      _editProfileFailure;
}
