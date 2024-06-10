/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"tripId":1674,"startStation":"المراغة","endStation":"سوهاج","startTime":"2024-06-10T17:30:00.621","endTime":"2024-06-10T18:30:00.621","price":20,"seatNumber":5,"passengerName":"string","isPublic":false},{"tripId":1674,"startStation":"المراغة","endStation":"سوهاج","startTime":"2024-06-10T17:30:00.621","endTime":"2024-06-10T18:30:00.621","price":20,"seatNumber":6,"passengerName":"string","isPublic":false},{"tripId":1674,"startStation":"المراغة","endStation":"سوهاج","startTime":"2024-06-10T17:30:00.621","endTime":"2024-06-10T18:30:00.621","price":20,"seatNumber":10,"passengerName":"string","isPublic":false},{"tripId":1674,"startStation":"المراغة","endStation":"سوهاج","startTime":"2024-06-10T17:30:00.621","endTime":"2024-06-10T18:30:00.621","price":20,"seatNumber":11,"passengerName":"string","isPublic":false}]

class CommingTrips {
  CommingTrips({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<Data>? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  CommingTrips.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  bool? _isSuccess;
  dynamic _message;
  List<Data>? _data;
  CommingTrips copyWith({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<Data>? data,
  }) =>
      CommingTrips(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );
  num? get status => _status;
  bool? get isSuccess => _isSuccess;
  dynamic get message => _message;
  List<Data>? get data => _data;

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

/// tripId : 1674
/// startStation : "المراغة"
/// endStation : "سوهاج"
/// startTime : "2024-06-10T17:30:00.621"
/// endTime : "2024-06-10T18:30:00.621"
/// price : 20
/// seatNumber : 5
/// passengerName : "string"
/// isPublic : false

class Data {
  Data({
    num? tripId,
    String? startStation,
    String? endStation,
    String? startTime,
    String? endTime,
    num? price,
    num? seatNumber,
    String? passengerName,
    bool? isPublic,
  }) {
    _tripId = tripId;
    _startStation = startStation;
    _endStation = endStation;
    _startTime = startTime;
    _endTime = endTime;
    _price = price;
    _seatNumber = seatNumber;
    _passengerName = passengerName;
    _isPublic = isPublic;
  }

  Data.fromJson(dynamic json) {
    _tripId = json['tripId'];
    _startStation = json['startStation'];
    _endStation = json['endStation'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _price = json['price'];
    _seatNumber = json['seatNumber'];
    _passengerName = json['passengerName'];
    _isPublic = json['isPublic'];
  }
  num? _tripId;
  String? _startStation;
  String? _endStation;
  String? _startTime;
  String? _endTime;
  num? _price;
  num? _seatNumber;
  String? _passengerName;
  bool? _isPublic;
  Data copyWith({
    num? tripId,
    String? startStation,
    String? endStation,
    String? startTime,
    String? endTime,
    num? price,
    num? seatNumber,
    String? passengerName,
    bool? isPublic,
  }) =>
      Data(
        tripId: tripId ?? _tripId,
        startStation: startStation ?? _startStation,
        endStation: endStation ?? _endStation,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        price: price ?? _price,
        seatNumber: seatNumber ?? _seatNumber,
        passengerName: passengerName ?? _passengerName,
        isPublic: isPublic ?? _isPublic,
      );
  num? get tripId => _tripId;
  String? get startStation => _startStation;
  String? get endStation => _endStation;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  num? get price => _price;
  num? get seatNumber => _seatNumber;
  String? get passengerName => _passengerName;
  bool? get isPublic => _isPublic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripId'] = _tripId;
    map['startStation'] = _startStation;
    map['endStation'] = _endStation;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['price'] = _price;
    map['seatNumber'] = _seatNumber;
    map['passengerName'] = _passengerName;
    map['isPublic'] = _isPublic;
    return map;
  }
}
