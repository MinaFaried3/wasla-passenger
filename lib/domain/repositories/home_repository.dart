import 'package:wasla/app/shared/common/typedefs.dart';
import 'package:wasla/data/repositories/base_repository.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';

abstract class HomeRepository extends BaseRepository {
  FailureOrList<NotificationModel> getNotification();

  const HomeRepository();
}
