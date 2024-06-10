part of 'follow_request_cubit.dart';

@freezed
class FollowRequestState with _$FollowRequestState {
  const factory FollowRequestState.initial() = _Initial;

  const factory FollowRequestState.loading() = _loading;

  const factory FollowRequestState.getNotificationSuccess(
      {required List<FollowRequestModel> requests}) = _getNotificationSuccess;

  const factory FollowRequestState.getNotificationFailure(
      {required String message}) = _getNotificationFailure;
}
