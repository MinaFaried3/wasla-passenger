import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/shared/common/typedefs.dart';
import 'package:wasla/data/responses/base_response.dart';

part 'NotificationResponse.g.dart';

/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"id":76,"title":"New Follow Request.","description":"Mekha Safwat want to follow you.","notifactionImage":"https://wasla.runasp.net/Images/5029ef68-82a0-44d2-bf50-7fe429e340ce.jpg","notifactionName":"Mekha","type":"FollowReqeust","isRead":false}]
@JsonSerializable()
final class NotificationResponse
    extends BaseResponse<List<NotificationModelResponse?>?> {
  const NotificationResponse({
    required super.status,
    required super.message,
    required super.success,
    required super.data,
  });

  //from json
  factory NotificationResponse.fromJson(Json json) =>
      _$NotificationResponseFromJson(json);

  //to json
  Json toJson() => _$NotificationResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}

class NotificationModelResponse {
  NotificationModelResponse({
    int? id,
    String? title,
    String? description,
    String? notifactionImage,
    String? notifactionName,
    String? type,
    bool? isRead,
    String? notificationTime,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _notifactionImage = notifactionImage;
    _notifactionName = notifactionName;
    _type = type;
    _isRead = isRead;
    _notificationTime = notificationTime;
  }

  NotificationModelResponse.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _notifactionImage = json['notifactionImage'];
    _notifactionName = json['notifactionName'];
    _type = json['type'];
    _isRead = json['isRead'];
    _notificationTime = json['notificationTime'];
  }

  int? _id;
  String? _title;
  String? _description;
  String? _notifactionImage;
  String? _notifactionName;
  String? _type;
  bool? _isRead;
  String? _notificationTime;

  NotificationModelResponse copyWith(
          {int? id,
          String? title,
          String? description,
          String? notifactionImage,
          String? notifactionName,
          String? type,
          bool? isRead,
          String? notificationTime}) =>
      NotificationModelResponse(
          id: id ?? _id,
          title: title ?? _title,
          description: description ?? _description,
          notifactionImage: notifactionImage ?? _notifactionImage,
          notifactionName: notifactionName ?? _notifactionName,
          type: type ?? _type,
          isRead: isRead ?? _isRead,
          notificationTime: notificationTime ?? _notificationTime);

  int? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get notifactionImage => _notifactionImage;

  String? get notifactionName => _notifactionName;

  String? get notificationTime => _notificationTime;

  String? get type => _type;

  bool? get isRead => _isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['notifactionImage'] = _notifactionImage;
    map['notifactionName'] = _notifactionName;
    map['type'] = _type;
    map['isRead'] = _isRead;
    map['notificationTime'] = _notificationTime;
    return map;
  }
}
