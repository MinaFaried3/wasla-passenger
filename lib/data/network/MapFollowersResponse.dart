/// status : 200
/// isSuccess : true
/// message : null
/// data : [{"id":"ca5c6ced-bdb1-4c06-bd3d-dda7d700a966","userName":"osamaRafat","customerImageUrl":"https://wasla.runasp.net/Images/4ef8e33b-cd27-4898-9ccd-19b5be6747f9.png","companyImageUrl":"https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg","startLangtitude":"31.50580197570988","startLatitude":"26.76795280477549","endLangtitude":"31.7077129000285","endLatitude":"26.56334141445074","fullName":"mohamed ali","latitude":"1233.2222","langtitude":"1233.2222","isPublic":true,"tripId":89}]

class MapFollowersResponse {
  MapFollowersResponse({
    int? status,
    bool? isSuccess,
    dynamic message,
    List<MapFollowerModel>? data,
  }) {
    _status = status;
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
  }

  MapFollowersResponse.fromJson(dynamic json) {
    _status = json['status'];
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MapFollowerModel.fromJson(v));
      });
    }
  }

  int? _status;
  bool? _isSuccess;
  dynamic _message;
  List<MapFollowerModel>? _data;

  MapFollowersResponse copyWith({
    int? status,
    bool? isSuccess,
    dynamic message,
    List<MapFollowerModel>? data,
  }) =>
      MapFollowersResponse(
        status: status ?? _status,
        isSuccess: isSuccess ?? _isSuccess,
        message: message ?? _message,
        data: data ?? _data,
      );

  int? get status => _status;

  bool? get isSuccess => _isSuccess;

  dynamic get message => _message;

  List<MapFollowerModel>? get data => _data;

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

/// id : "ca5c6ced-bdb1-4c06-bd3d-dda7d700a966"
/// userName : "osamaRafat"
/// customerImageUrl : "https://wasla.runasp.net/Images/4ef8e33b-cd27-4898-9ccd-19b5be6747f9.png"
/// companyImageUrl : "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg"
/// startLangtitude : "31.50580197570988"
/// startLatitude : "26.76795280477549"
/// endLangtitude : "31.7077129000285"
/// endLatitude : "26.56334141445074"
/// fullName : "mohamed ali"
/// latitude : "1233.2222"
/// langtitude : "1233.2222"
/// isPublic : true
/// tripId : 89

class MapFollowerModel {
  MapFollowerModel({
    String? id,
    String? userName,
    String? customerImageUrl,
    String? companyImageUrl,
    String? startLangtitude,
    String? startLatitude,
    String? endLangtitude,
    String? endLatitude,
    String? fullName,
    String? latitude,
    String? langtitude,
    bool? isPublic,
    int? tripId,
  }) {
    _id = id;
    _userName = userName;
    _customerImageUrl = customerImageUrl;
    _companyImageUrl = companyImageUrl;
    _startLangtitude = startLangtitude;
    _startLatitude = startLatitude;
    _endLangtitude = endLangtitude;
    _endLatitude = endLatitude;
    _fullName = fullName;
    _latitude = latitude;
    _langtitude = langtitude;
    _isPublic = isPublic;
    _tripId = tripId;
  }

  MapFollowerModel.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _customerImageUrl = json['customerImageUrl'];
    _companyImageUrl = json['companyImageUrl'];
    _startLangtitude = json['startLangtitude'];
    _startLatitude = json['startLatitude'];
    _endLangtitude = json['endLangtitude'];
    _endLatitude = json['endLatitude'];
    _fullName = json['fullName'];
    _latitude = json['latitude'];
    _langtitude = json['langtitude'];
    _isPublic = json['isPublic'];
    _tripId = json['tripId'];
  }

  String? _id;
  String? _userName;
  String? _customerImageUrl;
  String? _companyImageUrl;
  String? _startLangtitude;
  String? _startLatitude;
  String? _endLangtitude;
  String? _endLatitude;
  String? _fullName;
  String? _latitude;
  String? _langtitude;
  bool? _isPublic;
  int? _tripId;

  MapFollowerModel copyWith({
    String? id,
    String? userName,
    String? customerImageUrl,
    String? companyImageUrl,
    String? startLangtitude,
    String? startLatitude,
    String? endLangtitude,
    String? endLatitude,
    String? fullName,
    String? latitude,
    String? langtitude,
    bool? isPublic,
    int? tripId,
  }) =>
      MapFollowerModel(
        id: id ?? _id,
        userName: userName ?? _userName,
        customerImageUrl: customerImageUrl ?? _customerImageUrl,
        companyImageUrl: companyImageUrl ?? _companyImageUrl,
        startLangtitude: startLangtitude ?? _startLangtitude,
        startLatitude: startLatitude ?? _startLatitude,
        endLangtitude: endLangtitude ?? _endLangtitude,
        endLatitude: endLatitude ?? _endLatitude,
        fullName: fullName ?? _fullName,
        latitude: latitude ?? _latitude,
        langtitude: langtitude ?? _langtitude,
        isPublic: isPublic ?? _isPublic,
        tripId: tripId ?? _tripId,
      );

  String? get id => _id;

  String? get userName => _userName;

  String? get customerImageUrl => _customerImageUrl;

  String? get companyImageUrl => _companyImageUrl;

  String? get startLangtitude => _startLangtitude;

  String? get startLatitude => _startLatitude;

  String? get endLangtitude => _endLangtitude;

  String? get endLatitude => _endLatitude;

  String? get fullName => _fullName;

  String? get latitude => _latitude;

  String? get langtitude => _langtitude;

  bool? get isPublic => _isPublic;

  int? get tripId => _tripId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['customerImageUrl'] = _customerImageUrl;
    map['companyImageUrl'] = _companyImageUrl;
    map['startLangtitude'] = _startLangtitude;
    map['startLatitude'] = _startLatitude;
    map['endLangtitude'] = _endLangtitude;
    map['endLatitude'] = _endLatitude;
    map['fullName'] = _fullName;
    map['latitude'] = _latitude;
    map['langtitude'] = _langtitude;
    map['isPublic'] = _isPublic;
    map['tripId'] = _tripId;
    return map;
  }
}
