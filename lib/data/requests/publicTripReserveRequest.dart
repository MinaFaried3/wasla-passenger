/// onRoad : false
/// locationDescription : "string"
/// publicDriverTripId : 29

class PublicTripReserveRequest {
  PublicTripReserveRequest({
    bool? onRoad,
    String? locationDescription,
    num? publicDriverTripId,
  }) {
    _onRoad = onRoad;
    _locationDescription = locationDescription;
    _publicDriverTripId = publicDriverTripId;
  }

  PublicTripReserveRequest.fromJson(dynamic json) {
    _onRoad = json['onRoad'];
    _locationDescription = json['locationDescription'];
    _publicDriverTripId = json['publicDriverTripId'];
  }
  bool? _onRoad;
  String? _locationDescription;
  num? _publicDriverTripId;
  PublicTripReserveRequest copyWith({
    bool? onRoad,
    String? locationDescription,
    num? publicDriverTripId,
  }) =>
      PublicTripReserveRequest(
        onRoad: onRoad ?? _onRoad,
        locationDescription: locationDescription ?? _locationDescription,
        publicDriverTripId: publicDriverTripId ?? _publicDriverTripId,
      );
  bool? get onRoad => _onRoad;
  String? get locationDescription => _locationDescription;
  num? get publicDriverTripId => _publicDriverTripId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['onRoad'] = _onRoad;
    map['locationDescription'] = _locationDescription;
    map['publicDriverTripId'] = _publicDriverTripId;
    return map;
  }
}
