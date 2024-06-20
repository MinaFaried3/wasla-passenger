import 'package:equatable/equatable.dart';
import 'package:wasla/app/shared/enums/notification_type.dart';

class NotificationModel extends Equatable {
  final int _id;
  final String _title;
  final String _description;
  final String _notificationImage;
  final String _notificationName;
  final String _notificationTime;
  final NotificationType _type;
  final bool _isRead;

  const NotificationModel(
      {required int id,
      required String title,
      required String description,
      required String notificationImage,
      required String notificationName,
      required String notificationTime,
      required NotificationType type,
      required bool isRead})
      : _id = id,
        _title = title,
        _description = description,
        _notificationImage = notificationImage,
        _notificationName = notificationName,
        _type = type,
        _isRead = isRead,
        _notificationTime = notificationTime;

  NotificationModel copyWith({
    int? id,
    String? title,
    String? description,
    String? notificationImage,
    String? notificationName,
    String? notificationTime,
    NotificationType? type,
    bool? isRead,
  }) =>
      NotificationModel(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        notificationImage: notificationImage ?? _notificationImage,
        notificationName: notificationName ?? _notificationName,
        notificationTime: notificationTime ?? _notificationTime,
        type: type ?? _type,
        isRead: isRead ?? _isRead,
      );

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get notificationImage => _notificationImage;

  String get notificationName => _notificationName;

  String get notificationTime => _notificationTime;

  NotificationType get type => _type;

  bool get isRead => _isRead;

  @override
  List<Object> get props => [
        _id,
        _title,
        _description,
        _notificationImage,
        _notificationName,
        _type,
        _isRead,
        _notificationTime
      ];

  @override
  String toString() {
    return 'NotificationModel{_id: $_id, _title: $_title, _description: $_description, _notificationImage: $_notificationImage, _notificationName: $_notificationName, _notificationTime: $_notificationTime, _type: $_type, _isRead: $_isRead}';
  }
}
