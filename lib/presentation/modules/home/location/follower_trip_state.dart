part of 'follower_trip_cubit.dart';

@freezed
class FollowerTripState with _$FollowerTripState {
  const factory FollowerTripState.initial() = _Initial;

  const factory FollowerTripState.loading() = _loading;

  const factory FollowerTripState.getFollowerTripsSuccess(
      {required List<MapFollowerModel> followers}) = _getFollowerTripsSuccess;

  const factory FollowerTripState.getFollowerTripsFailure(
      {required String message}) = _getFollowerTripsFailure;
}
