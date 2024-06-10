part of 'org_trip_reserve_cubit.dart';

@freezed
class OrgTripReserveState with _$OrgTripReserveState {
  const factory OrgTripReserveState.initial() = _Initial;

  const factory OrgTripReserveState.loading() = _loading;

  const factory OrgTripReserveState.requestOrgTripSuccess(
      {required String message}) = _requestOrgTripSuccess;

  const factory OrgTripReserveState.requestOrgTripFailure(
      {required String message}) = _requestOrgTripFailure;
}
