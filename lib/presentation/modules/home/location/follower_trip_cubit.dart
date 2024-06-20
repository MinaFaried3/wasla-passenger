import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/network/MapFollowersResponse.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';

part 'follower_trip_cubit.freezed.dart';
part 'follower_trip_state.dart';

class FollowerTripCubit extends Cubit<FollowerTripState> {
  FollowerTripCubit() : super(const FollowerTripState.initial());

  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void getFollowerTrips() async {
    emit(FollowerTripState.loading());

    final result = await authRepositoryImpl.getFollowerTrips();
    result.fold(
        (l) =>
            emit(FollowerTripState.getFollowerTripsFailure(message: l.message)),
        (r) => emit(FollowerTripState.getFollowerTripsSuccess(followers: r)));
  }

  void backToInitial() {
    emit(FollowerTripState.initial());
  }
}
