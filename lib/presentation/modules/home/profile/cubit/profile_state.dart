part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = _loading;

  const factory ProfileState.getProfileSuccess(
      {required ProfileModel profile}) = _getProfileSuccess;

  const factory ProfileState.getProfileFailure({required String message}) =
      _getProfileFailure;
}
