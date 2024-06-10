import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/wasla.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';

part 'follow_cubit.freezed.dart';
part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  FollowCubit() : super(const FollowState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void searchByUserName(String username) async {
    emit(FollowState.loading());

    final result =
        await authRepositoryImpl.searchByUserName(username: username);
    result.fold(
        (l) =>
            emit(FollowState.getPassengerFollowItemFailure(message: l.message)),
        (r) => emit(FollowState.getPassengerFollowItemSuccess(passenger: r)));
    createFollowCubit.backToInitial();
  }
}
