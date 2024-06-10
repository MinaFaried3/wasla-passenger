import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/requests/publicTripReserveRequest.dart';

part 'public_trip_reserve_cubit.freezed.dart';
part 'public_trip_reserve_state.dart';

class PublicTripReserveCubit extends Cubit<PublicTripReserveState> {
  PublicTripReserveCubit() : super(const PublicTripReserveState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void requestPublicTrip(
      PublicTripReserveRequest publicTripReserveRequest) async {
    emit(PublicTripReserveState.loading());

    final result = await authRepositoryImpl.requestPublicTrip(
        publicTripReserveRequest: publicTripReserveRequest);
    result.fold(
        (l) => emit(PublicTripReserveState.requestPublicTripFailure(
            message: l.message)),
        (r) => emit(PublicTripReserveState.requestPublicTripSuccess()));
  }

  void backToInitial() {
    emit(PublicTripReserveState.initial());
  }
}
