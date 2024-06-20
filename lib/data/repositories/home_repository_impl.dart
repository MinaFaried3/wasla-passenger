import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/services/shared_preferences/app_preferences.dart';
import 'package:wasla/app/shared/common/typedefs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/data_source/remote_data_source.dart';
import 'package:wasla/data/mappers/home/notification_mappers.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/network/network_checker.dart';
import 'package:wasla/data/responses/home/NotificationResponse.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';
import 'package:wasla/domain/repositories/home_repository.dart';

final class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChecker;
  final ApiServiceClient apiServiceClient;

  const HomeRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required LocalDataSource localDataSource,
      required NetworkChecker networkChecker,
      required this.apiServiceClient})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkChecker = networkChecker;

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  RemoteDataSource get remoteDataSource => _remoteDataSource;

  @override
  LocalDataSource get localDataSource => _localDataSource;

  Future<String> get bearerToken async {
    return "Bearer ${await getIt<AppPreferences>().getToken()}";
  }

  @override
  FailureOrList<NotificationModel> getNotification() async {
    return await executeApiCall<NotificationResponse, List<NotificationModel>>(
      apiCall: () async => remoteDataSource.getNotification(),
      onSuccess: (response) => response.toDomain(),
    );
  }
}
