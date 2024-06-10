part of 'public_trip_reserve_cubit.dart';

@freezed
class PublicTripReserveState with _$PublicTripReserveState {
  const factory PublicTripReserveState.initial() = _Initial;

  const factory PublicTripReserveState.loading() = _loading;

  const factory PublicTripReserveState.requestPublicTripSuccess() =
      _requestPublicTripSuccess;

  const factory PublicTripReserveState.requestPublicTripFailure(
      {required String message}) = _requestPublicTripFailure;
}
