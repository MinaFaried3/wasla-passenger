import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';
import 'package:wasla/domain/usecases/home/get_notification_use_case.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.getNotificationUseCase)
      : super(const NotificationState.initial());

  final GetNotificationUseCase getNotificationUseCase;

  void getNotification() async {
    emit(const NotificationState.loading());
    final result = await getNotificationUseCase();
    result.fold(
        (l) =>
            emit(NotificationState.getNotificationFailure(message: l.message)),
        (r) =>
            emit(NotificationState.getNotificationSuccess(notifications: r)));
  }
}
