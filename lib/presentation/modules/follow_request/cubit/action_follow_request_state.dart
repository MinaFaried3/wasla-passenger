part of 'action_follow_request_cubit.dart';

@freezed
class ActionFollowRequestState with _$ActionFollowRequestState {
  const factory ActionFollowRequestState.initial() = _Initial;

  const factory ActionFollowRequestState.loading() = _loading;

  const factory ActionFollowRequestState.actionFollowRequestSuccess(
      {required String message}) = _actionFollowRequestSuccess;

  const factory ActionFollowRequestState.actionFollowRequestFailure(
      {required String message}) = _actionFollowRequestFailure;
}
