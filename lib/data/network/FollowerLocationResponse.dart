/// status : 200
/// isSuccess : true
/// message : null
/// data : {"langtitude":"1233.2222","latitude":"1233.2222","tripId":89}

class FollowerLocationResponse {
  FollowerLocationResponse({
    int? status,
    bool? isSuccess,
    dynamic message,
    FollowerLocationModel? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  FollowerLocationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    _data = json['data'] != null
        ? FollowerLocationModel.fromJson(json['data'])
        : null;
  }
  int? _status;
  bool? _isSuccess;
  dynamic _message;
  FollowerLocationModel? _data;
  FollowerLocationResponse copyWith({
    int? status,
    bool? isSuccess,
    dynamic message,
    FollowerLocationModel? data,
  }) =>
      FollowerLocationResponse(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );
  int? get status => _status;
  bool? get isSuccess => _isSuccess;
  dynamic get message => _message;
  FollowerLocationModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['isSuccess'] = _isSuccess;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// langtitude : "1233.2222"
/// latitude : "1233.2222"
/// tripId : 89

class FollowerLocationModel {
  FollowerLocationModel({
    String? langtitude,
    String? latitude,
    int? tripId,
  }) {
    _langtitude = langtitude;
    _latitude = latitude;
    _tripId = tripId;
  }

  FollowerLocationModel.fromJson(dynamic json) {
    _langtitude = json['langtitude'];
    _latitude = json['latitude'];
    _tripId = json['tripId'];
  }
  String? _langtitude;
  String? _latitude;
  int? _tripId;
  FollowerLocationModel copyWith({
    String? langtitude,
    String? latitude,
    int? tripId,
  }) =>
      FollowerLocationModel(
        langtitude: langtitude ?? _langtitude,
        latitude: latitude ?? _latitude,
        tripId: tripId ?? _tripId,
      );
  String? get langtitude => _langtitude;
  String? get latitude => _latitude;
  int? get tripId => _tripId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['langtitude'] = _langtitude;
    map['latitude'] = _latitude;
    map['tripId'] = _tripId;
    return map;
  }
}
