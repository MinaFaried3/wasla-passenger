part of 'follow_cubit.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState.initial() = _Initial;

  const factory FollowState.loading() = _loading;

  const factory FollowState.getPassengerFollowItemSuccess(
      {required PassengerItemModel passenger}) = _getPassengerFollowItemSuccess;

  const factory FollowState.getPassengerFollowItemFailure(
      {required String message}) = _getPassengerFollowItemFailure;
}
