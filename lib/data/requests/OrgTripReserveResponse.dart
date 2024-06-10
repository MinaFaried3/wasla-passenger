/// tripId : 0
/// onRoad : true
/// locationDescription : "string"
/// seats : [{"name":"string","seatNum":0,"qrCodeFile":"string"}]

class OrgTripReserveRequest {
  OrgTripReserveRequest({
    num? tripId,
    bool? onRoad,
    String? locationDescription,
    List<Seats>? seats,
  }) {
    _tripId = tripId;
    _onRoad = onRoad;
    _locationDescription = locationDescription;
    _seats = seats;
  }

  OrgTripReserveRequest.fromJson(dynamic json) {
    _tripId = json['tripId'];
    _onRoad = json['onRoad'];
    _locationDescription = json['locationDescription'];
    if (json['seats'] != null) {
      _seats = [];
      json['seats'].forEach((v) {
        _seats?.add(Seats.fromJson(v));
      });
    }
  }

  num? _tripId;
  bool? _onRoad;
  String? _locationDescription;
  List<Seats>? _seats;

  OrgTripReserveRequest copyWith({
    num? tripId,
    bool? onRoad,
    String? locationDescription,
    List<Seats>? seats,
  }) =>
      OrgTripReserveRequest(
        tripId: tripId ?? _tripId,
        onRoad: onRoad ?? _onRoad,
        locationDescription: locationDescription ?? _locationDescription,
        seats: seats ?? _seats,
      );

  num? get tripId => _tripId;

  bool? get onRoad => _onRoad;

  String? get locationDescription => _locationDescription;

  List<Seats>? get seats => _seats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripId'] = _tripId;
    map['onRoad'] = _onRoad;
    map['locationDescription'] = _locationDescription;
    if (_seats != null) {
      map['seats'] = _seats?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "string"
/// seatNum : 0
/// qrCodeFile : "string"

class Seats {
  Seats({
    String? name,
    num? seatNum,
    String? qrCodeFile,
  }) {
    _name = name;
    _seatNum = seatNum;
    _qrCodeFile = qrCodeFile;
  }

  Seats.fromJson(dynamic json) {
    _name = json['name'];
    _seatNum = json['seatNum'];
    _qrCodeFile = json['qrCodeFile'];
  }

  String? _name;
  num? _seatNum;
  String? _qrCodeFile;

  Seats copyWith({
    String? name,
    num? seatNum,
    String? qrCodeFile,
  }) =>
      Seats(
        name: name ?? _name,
        seatNum: seatNum ?? _seatNum,
        qrCodeFile: qrCodeFile ?? _qrCodeFile,
      );

  String? get name => _name;

  num? get seatNum => _seatNum;

  String? get qrCodeFile => _qrCodeFile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['seatNum'] = _seatNum;
    map['qrCodeFile'] = _qrCodeFile;
    return map;
  }
}
