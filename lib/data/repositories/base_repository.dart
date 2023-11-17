import 'package:wasla/app/shared/common/common_libs.dart';

abstract class BaseRepository {
  RemoteDataSource get remoteDataSource;

  NetworkChecker get networkChecker;

  const BaseRepository();
}
