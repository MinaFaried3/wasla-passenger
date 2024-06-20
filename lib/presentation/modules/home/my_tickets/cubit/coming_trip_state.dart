part of 'coming_trip_cubit.dart';

@freezed
class ComingTripState with _$ComingTripState {
  const factory ComingTripState.initial() = _Initial;

  const factory ComingTripState.loading() = _loading;

  const factory ComingTripState.getComingTripsSuccess(
      {required List<IncomingTripModel> comingTrip}) = _getComingTripsSuccess;

  const factory ComingTripState.emptyTickets() = _emptyTickets;

  const factory ComingTripState.getComingTripsFailure(
      {required String message}) = _getComingTripsFailure;
}
