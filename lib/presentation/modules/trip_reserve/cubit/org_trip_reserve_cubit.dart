import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/requests/OrgTripReserveResponse.dart';

part 'org_trip_reserve_cubit.freezed.dart';
part 'org_trip_reserve_state.dart';

class OrgTripReserveCubit extends Cubit<OrgTripReserveState> {
  OrgTripReserveCubit() : super(const OrgTripReserveState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void requestOrgTrip(OrgTripReserveRequest orgTripReserveRequest) async {
    emit(OrgTripReserveState.loading());

    final result = await authRepositoryImpl.requestOrgTrip(
        orgTripReserveRequest: orgTripReserveRequest);
    result.fold(
        (l) =>
            emit(OrgTripReserveState.requestOrgTripFailure(message: l.message)),
        (r) => emit(OrgTripReserveState.requestOrgTripSuccess(message: r)));
  }

  void backToInitial() {
    emit(OrgTripReserveState.initial());
  }
}
