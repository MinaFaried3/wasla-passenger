part of 'create_follow_cubit.dart';

@freezed
class CreateFollowState with _$CreateFollowState {
  const factory CreateFollowState.initial() = _Initial;

  const factory CreateFollowState.createFollowRequestloading() =
      _createFollowRequestloading;

  const factory CreateFollowState.createFollowRequestSuccess(
      {required String message}) = _createFollowRequestSuccess;

  const factory CreateFollowState.createFollowRequestFailure(
      {required String message}) = _createFollowRequestFailure;
}
