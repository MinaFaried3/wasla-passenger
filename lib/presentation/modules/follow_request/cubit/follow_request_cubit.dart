import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/home/FollowRequestsResponse.dart';

part 'follow_request_cubit.freezed.dart';
part 'follow_request_state.dart';

class FollowRequestCubit extends Cubit<FollowRequestState> {
  FollowRequestCubit() : super(const FollowRequestState.initial());
  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  void getRequests() async {
    emit(FollowRequestState.loading());

    final result = await authRepositoryImpl.displayFollowRequest();
    result.fold(
        (l) =>
            emit(FollowRequestState.getNotificationFailure(message: l.message)),
        (r) => emit(FollowRequestState.getNotificationSuccess(requests: r)));
  }

  void backToInitial() {
    emit(FollowRequestState.initial());
  }
}
