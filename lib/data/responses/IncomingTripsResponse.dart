/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"tripId":76,"startStation":"طهطا","endStation":"سوهاج الجامعة القديمة","startTime":"2024-06-10T20:42:27.967","endTime":"2024-06-10T21:42:27.967","price":10,"seatNumber":null,"passengerName":"Osama Rafat","isPublic":true,"organization":null,"publicDriver":{"fullName":"mohamed ali","photoUrl":"https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"}},{"tripId":1731,"startStation":"الصوامعة","endStation":"دار السلام","startTime":"2024-06-24T10:59:59.621","endTime":"2024-06-24T11:59:59.621","price":20,"seatNumber":1,"passengerName":"osama","isPublic":false,"organization":{"name":"horus","logoUrl":"https://wasla.runasp.net/Images/b960cd4c-6a1b-455f-9934-a3f0ba72737c.jpg","points":10},"publicDriver":null},{"tripId":1731,"startStation":"الصوامعة","endStation":"دار السلام","startTime":"2024-06-24T10:59:59.621","endTime":"2024-06-24T11:59:59.621","price":20,"seatNumber":2,"passengerName":"osama","isPublic":false,"organization":{"name":"horus","logoUrl":"https://wasla.runasp.net/Images/b960cd4c-6a1b-455f-9934-a3f0ba72737c.jpg","points":10},"publicDriver":null},{"tripId":1731,"startStation":"الصوامعة","endStation":"دار السلام","startTime":"2024-06-24T10:59:59.621","endTime":"2024-06-24T11:59:59.621","price":20,"seatNumber":3,"passengerName":"karim","isPublic":false,"organization":{"name":"horus","logoUrl":"https://wasla.runasp.net/Images/b960cd4c-6a1b-455f-9934-a3f0ba72737c.jpg","points":10},"publicDriver":null}]

class IncomingTripsResponse {
  IncomingTripsResponse({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<IncomingTripModel>? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  IncomingTripsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(IncomingTripModel.fromJson(v));
      });
    }
  }

  num? _status;
  bool? _isSuccess;
  dynamic _message;
  List<IncomingTripModel>? _data;

  IncomingTripsResponse copyWith({
    num? status,
    bool? isSuccess,
    dynamic message,
    List<IncomingTripModel>? data,
  }) =>
      IncomingTripsResponse(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get status => _status;

  bool? get isSuccess => _isSuccess;

  dynamic get message => _message;

  List<IncomingTripModel>? get data => _data;

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

/// tripId : 76
/// startStation : "طهطا"
/// endStation : "سوهاج الجامعة القديمة"
/// startTime : "2024-06-10T20:42:27.967"
/// endTime : "2024-06-10T21:42:27.967"
/// price : 10
/// seatNumber : null
/// passengerName : "Osama Rafat"
/// isPublic : true
/// organization : null
/// publicDriver : {"fullName":"mohamed ali","photoUrl":"https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"}

class IncomingTripModel {
  IncomingTripModel({
    num? tripId,
    String? startStation,
    String? endStation,
    String? startTime,
    String? endTime,
    num? price,
    int? seatNumber,
    String? passengerName,
    bool? isPublic,
    OrganizationModel? organization,
    PublicDriver? publicDriver,
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
    _organization = organization;
    _publicDriver = publicDriver;
  }

  IncomingTripModel.fromJson(dynamic json) {
    _tripId = json['tripId'];
    _startStation = json['startStation'];
    _endStation = json['endStation'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _price = json['price'];
    _seatNumber = json['seatNumber'];
    _passengerName = json['passengerName'];
    _isPublic = json['isPublic'];
    _organization = json['organization'] != null
        ? OrganizationModel.fromJson(json['organization'])
        : null;
    _publicDriver = json['publicDriver'] != null
        ? PublicDriver.fromJson(json['publicDriver'])
        : null;
  }

  num? _tripId;
  String? _startStation;
  String? _endStation;
  String? _startTime;
  String? _endTime;
  num? _price;
  int? _seatNumber;
  String? _passengerName;
  bool? _isPublic;
  OrganizationModel? _organization;
  PublicDriver? _publicDriver;

  IncomingTripModel copyWith({
    num? tripId,
    String? startStation,
    String? endStation,
    String? startTime,
    String? endTime,
    num? price,
    int? seatNumber,
    String? passengerName,
    bool? isPublic,
    OrganizationModel? organization,
    PublicDriver? publicDriver,
  }) =>
      IncomingTripModel(
        tripId: tripId ?? _tripId,
        startStation: startStation ?? _startStation,
        endStation: endStation ?? _endStation,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        price: price ?? _price,
        seatNumber: seatNumber ?? _seatNumber,
        passengerName: passengerName ?? _passengerName,
        isPublic: isPublic ?? _isPublic,
        organization: organization ?? _organization,
        publicDriver: publicDriver ?? _publicDriver,
      );

  num? get tripId => _tripId;

  String? get startStation => _startStation;

  String? get endStation => _endStation;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  num? get price => _price;

  int? get seatNumber => _seatNumber;

  String? get passengerName => _passengerName;

  bool? get isPublic => _isPublic;

  OrganizationModel? get organization => _organization;

  PublicDriver? get publicDriver => _publicDriver;

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
    if (_organization != null) {
      map['organization'] = _organization?.toJson();
    }
    if (_publicDriver != null) {
      map['publicDriver'] = _publicDriver?.toJson();
    }
    return map;
  }
}

/// fullName : "mohamed ali"
/// photoUrl : "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"

class PublicDriver {
  PublicDriver({
    String? fullName,
    String? photoUrl,
  }) {
    _fullName = fullName;
    _photoUrl = photoUrl;
  }

  PublicDriver.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _photoUrl = json['photoUrl'];
  }

  String? _fullName;
  String? _photoUrl;

  PublicDriver copyWith({
    String? fullName,
    String? photoUrl,
  }) =>
      PublicDriver(
        fullName: fullName ?? _fullName,
        photoUrl: photoUrl ?? _photoUrl,
      );

  String? get fullName => _fullName;

  String? get photoUrl => _photoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['photoUrl'] = _photoUrl;
    return map;
  }
}

class OrganizationModel {
  OrganizationModel({
    String? name,
    String? logoUrl,
    num? points,
  }) {
    _name = name;
    _logoUrl = logoUrl;
    _points = points;
  }

  OrganizationModel.fromJson(dynamic json) {
    _name = json['name'];
    _logoUrl = json['logoUrl'];
    _points = json['points'];
  }

  String? _name;
  String? _logoUrl;
  num? _points;

  OrganizationModel copyWith({
    String? name,
    String? logoUrl,
    num? points,
  }) =>
      OrganizationModel(
        name: name ?? _name,
        logoUrl: logoUrl ?? _logoUrl,
        points: points ?? _points,
      );

  String? get name => _name;

  String? get logoUrl => _logoUrl;

  num? get points => _points;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['logoUrl'] = _logoUrl;
    map['points'] = _points;
    return map;
  }
}
