import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/TripSeatsResponse.dart';

part 'trip_seats_cubit.freezed.dart';
part 'trip_seats_state.dart';

class TripSeatsCubit extends Cubit<TripSeatsState> {
  TripSeatsCubit() : super(const TripSeatsState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void getTripSeats(String tripId) async {
    emit(TripSeatsState.loading());

    final result = await authRepositoryImpl.getTripSeats(tripId: tripId);
    result.fold(
        (l) => emit(TripSeatsState.getTripSeatsFailure(message: l.message)),
        (r) {
      List<SeatModel> seats = [SeatModel(isAvailable: false, setNum: -1)];
      if (r.length > 14) {
        seats.add(SeatModel(isAvailable: false, setNum: -2));
      }
      seats.addAll(r);
      emit(TripSeatsState.getTripSeatsSuccess(seats: seats));
    });
  }

  void backToInitial() {
    emit(TripSeatsState.initial());
  }
}
