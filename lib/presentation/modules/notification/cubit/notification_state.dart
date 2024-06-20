part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loading() = _loading;

  const factory NotificationState.getNotificationSuccess(
          {required List<NotificationModel> notifications}) =
      _getNotificationSuccess;

  const factory NotificationState.getNotificationFailure(
      {required String message}) = _getNotificationFailure;
}
