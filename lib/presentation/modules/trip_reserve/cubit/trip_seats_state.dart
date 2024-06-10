part of 'trip_seats_cubit.dart';

@freezed
class TripSeatsState with _$TripSeatsState {
  const factory TripSeatsState.initial() = _Initial;

  const factory TripSeatsState.loading() = _loading;

  const factory TripSeatsState.getTripSeatsSuccess(
      {required List<SeatModel> seats}) = _getTripSeatsSuccess;

  const factory TripSeatsState.getTripSeatsFailure({required String message}) =
      _getTripSeatsFailure;
}
