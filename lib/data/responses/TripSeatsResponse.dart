/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"setNum":1,"isAvailable":true},{"setNum":2,"isAvailable":true},{"setNum":3,"isAvailable":true},{"setNum":4,"isAvailable":true},{"setNum":5,"isAvailable":true},{"setNum":6,"isAvailable":true},{"setNum":7,"isAvailable":true},{"setNum":8,"isAvailable":true},{"setNum":9,"isAvailable":true},{"setNum":10,"isAvailable":true},{"setNum":11,"isAvailable":true},{"setNum":12,"isAvailable":true},{"setNum":13,"isAvailable":true},{"setNum":14,"isAvailable":true},{"setNum":15,"isAvailable":true},{"setNum":16,"isAvailable":true},{"setNum":17,"isAvailable":true},{"setNum":18,"isAvailable":true},{"setNum":19,"isAvailable":true},{"setNum":20,"isAvailable":true},{"setNum":21,"isAvailable":true},{"setNum":22,"isAvailable":true},{"setNum":23,"isAvailable":true},{"setNum":24,"isAvailable":true},{"setNum":25,"isAvailable":true},{"setNum":26,"isAvailable":true},{"setNum":27,"isAvailable":true},{"setNum":28,"isAvailable":true},{"setNum":29,"isAvailable":true},{"setNum":30,"isAvailable":true}]

class TripSeatsResponse {
  TripSeatsResponse({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<SeatModel>? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  TripSeatsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SeatModel.fromJson(v));
      });
    }
  }

  num? _status;
  bool? _isSuccess;
  dynamic _message;
  List<SeatModel>? _data;

  TripSeatsResponse copyWith({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<SeatModel>? data,
  }) =>
      TripSeatsResponse(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get status => _status;

  bool? get isSuccess => _isSuccess;

  dynamic get message => _message;

  List<SeatModel>? get data => _data;

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

/// setNum : 1
/// isAvailable : true

class SeatModel {
  SeatModel({
    num? setNum,
    bool? isAvailable,
  }) {
    _setNum = setNum;
    _isAvailable = isAvailable;
  }

  SeatModel.fromJson(dynamic json) {
    _setNum = json['setNum'];
    _isAvailable = json['isAvailable'];
  }

  num? _setNum;
  bool? _isAvailable;

  SeatModel copyWith({
    num? setNum,
    bool? isAvailable,
  }) =>
      SeatModel(
        setNum: setNum ?? _setNum,
        isAvailable: isAvailable ?? _isAvailable,
      );

  num? get setNum => _setNum;

  bool? get isAvailable => _isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['setNum'] = _setNum;
    map['isAvailable'] = _isAvailable;
    return map;
  }
}
