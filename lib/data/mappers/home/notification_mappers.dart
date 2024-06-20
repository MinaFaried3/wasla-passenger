// Extension for NotificationModelResponse to map it to NotificationModel
import 'package:wasla/app/shared/enums/notification_type.dart';
import 'package:wasla/data/responses/home/NotificationResponse.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';

extension NotificationModelResponseMapper on NotificationModelResponse? {
  NotificationModel toDomain() {
    return NotificationModel(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      description: this?.description ?? '',
      notificationImage: this?.notifactionImage ?? '',
      notificationName: this?.notifactionName ?? '',
      notificationTime: this?.notificationTime ?? '',
      type: mapNotificationType(this?.type),
      isRead: this?.isRead ?? false,
    );
  }

  NotificationType mapNotificationType(String? type) {
    switch (type) {
      case 'FollowReqeust':
        return NotificationType.FollowReqeust;
      case 'PackageRequest':
        return NotificationType.PackageRequest;
      case 'PackageAccept':
        return NotificationType.PackageAccept;
      case 'AdsAccept':
        return NotificationType.AdsAccept;
      case 'TripAlarm':
        return NotificationType.TripAlarm;
      default:
        return NotificationType.FollowReqeust; // Default case
    }
  }
}

// Extension for NotificationResponse to map it to List<NotificationModel>
extension NotificationResponseMapper on NotificationResponse? {
  List<NotificationModel> toDomain() {
    return this
            ?.data
            ?.map((notificationModelResponse) =>
                notificationModelResponse?.toDomain())
            .whereType<NotificationModel>()
            .toList() ??
        [];
  }
}
