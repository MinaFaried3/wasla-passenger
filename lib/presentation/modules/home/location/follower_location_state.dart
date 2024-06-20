part of 'follower_location_cubit.dart';

@freezed
class FollowerLocationState with _$FollowerLocationState {
  const factory FollowerLocationState.initial() = _Initial;

  const factory FollowerLocationState.loading() = _loading;

  const factory FollowerLocationState.getFollowerLocationSuccess(
      {required FollowerLocationModel location}) = _getFollowerLocationSuccess;

  const factory FollowerLocationState.getFollowerLocationFailure(
      {required String message}) = _getFollowerLocationFailure;
}
