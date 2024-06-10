/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"followingId":"578dcc60-f2f4-4d32-93c8-052c1fd956e6","name":"mekha safwat","userName":"mekha","photoUrl":"https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"}]

class FollowRequestsResponse {
  FollowRequestsResponse({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<FollowRequestModel>? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  FollowRequestsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(FollowRequestModel.fromJson(v));
      });
    }
  }

  num? _status;
  bool? _isSuccess;
  dynamic _message;
  List<FollowRequestModel>? _data;

  FollowRequestsResponse copyWith({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<FollowRequestModel>? data,
  }) =>
      FollowRequestsResponse(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get status => _status;

  bool? get isSuccess => _isSuccess;

  dynamic get message => _message;

  List<FollowRequestModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['isSuccess'] = _isSuccess;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// followingId : "578dcc60-f2f4-4d32-93c8-052c1fd956e6"
/// name : "mekha safwat"
/// userName : "mekha"
/// photoUrl : "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"

class FollowRequestModel {
  FollowRequestModel({
    String? followingId,
    String? name,
    String? userName,
    String? photoUrl,
  }) {
    _followingId = followingId;
    _name = name;
    _userName = userName;
    _photoUrl = photoUrl;
  }

  FollowRequestModel.fromJson(dynamic json) {
    _followingId = json['followingId'];
    _name = json['name'];
    _userName = json['userName'];
    _photoUrl = json['photoUrl'];
  }

  String? _followingId;
  String? _name;
  String? _userName;
  String? _photoUrl;

  FollowRequestModel copyWith({
    String? followingId,
    String? name,
    String? userName,
    String? photoUrl,
  }) =>
      FollowRequestModel(
        followingId: followingId ?? _followingId,
        name: name ?? _name,
        userName: userName ?? _userName,
        photoUrl: photoUrl ?? _photoUrl,
      );

  String? get followingId => _followingId;

  String? get name => _name;

  String? get userName => _userName;

  String? get photoUrl => _photoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['followingId'] = _followingId;
    map['name'] = _name;
    map['userName'] = _userName;
    map['photoUrl'] = _photoUrl;
    return map;
  }
}
