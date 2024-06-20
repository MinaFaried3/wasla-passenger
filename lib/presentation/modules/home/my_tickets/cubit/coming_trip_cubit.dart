import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/IncomingTripsResponse.dart';

part 'coming_trip_cubit.freezed.dart';
part 'coming_trip_state.dart';

class ComingTripCubit extends Cubit<ComingTripState> {
  ComingTripCubit() : super(const ComingTripState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();
  DateTime? incomingTripDateTime;

  void getComingTrips() async {
    emit(ComingTripState.loading());

    final result = await authRepositoryImpl.getComingTrips();
    result.fold(
        (l) => emit(ComingTripState.getComingTripsFailure(message: l.message)),
        (r) {
      if (r.isNotEmpty) {
        incomingTripDateTime = DateTime.parse(r[0].startTime.orEmpty());
        emit(ComingTripState.getComingTripsSuccess(comingTrip: r));
      } else {
        emit(ComingTripState.emptyTickets());
      }
    });
  }

  void backToInitial() {
    emit(ComingTripState.initial());
  }
}
