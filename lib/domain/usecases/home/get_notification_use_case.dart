import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';
import 'package:wasla/domain/repositories/home_repository.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class GetNotificationUseCase
    extends BaseUseCase<List<NotificationModel>, HomeRepository> {
  const GetNotificationUseCase({required super.repository});

  @override
  FailureOr<List<NotificationModel>> call() async {
    return await repository.getNotification();
  }
}
