import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';

part 'create_follow_cubit.freezed.dart';
part 'create_follow_state.dart';

class CreateFollowCubit extends Cubit<CreateFollowState> {
  CreateFollowCubit() : super(const CreateFollowState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void createFollowRequest(String followerId) async {
    emit(CreateFollowState.createFollowRequestloading());

    final result =
        await authRepositoryImpl.createFollowRequest(followerId: followerId);
    result.fold(
        (l) => emit(
            CreateFollowState.createFollowRequestFailure(message: l.message)),
        (r) => emit(CreateFollowState.createFollowRequestSuccess(message: r)));
  }

  void backToInitial() {
    emit(CreateFollowState.initial());
  }
}
