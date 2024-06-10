import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/wasla.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/presentation/modules/home/profile/cubit/profile_cubit.dart';

part 'action_follow_request_cubit.freezed.dart';
part 'action_follow_request_state.dart';

class ActionFollowRequestCubit extends Cubit<ActionFollowRequestState> {
  ActionFollowRequestCubit() : super(const ActionFollowRequestState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void takeFollowAction(bool accept, String senderId) async {
    emit(ActionFollowRequestState.loading());

    if (accept) {
      final result =
          await authRepositoryImpl.confirmFollowRequest(senderId: senderId);
      result.fold(
          (l) => emit(ActionFollowRequestState.actionFollowRequestFailure(
              message: l.message)),
          (r) => emit(
              ActionFollowRequestState.actionFollowRequestSuccess(message: r)));
    } else {
      final result =
          await authRepositoryImpl.rejectFollowRequest(senderId: senderId);
      result.fold(
          (l) => emit(ActionFollowRequestState.actionFollowRequestFailure(
              message: l.message)),
          (r) => emit(
              ActionFollowRequestState.actionFollowRequestSuccess(message: r)));
    }
    followRequestCubit.getRequests();
    getIt<ProfileCubit>().getProfile();
  }

  void backToInitial() {
    emit(ActionFollowRequestState.initial());
  }
}
