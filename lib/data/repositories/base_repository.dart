import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/network/error/data_source_status.dart';
import 'package:wasla/data/network/network_error_handler.dart';
import 'package:wasla/data/responses/base_response.dart';

abstract class BaseRepository {
  RemoteDataSource get remoteDataSource;

  NetworkChecker get networkChecker;

  LocalDataSource get localDataSource;

  const BaseRepository();

  FailureOr<Model> executeApiCall<Response extends BaseResponse, Model>({
    required Future<Response> Function() apiCall,
    required Model Function(Response) onSuccess,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }

    try {
      final response = await apiCall();

      if (response.success == true) {
        return Right(onSuccess(response));
      } else {
        return Left(ServerFailure(
          code: response.status ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  //todo
  //compare with expire data and token
  String getRefreshToken() {
    String refreshToken =
        getIt<AppPreferences>().getString(PrefKeys.refreshToken);
    return refreshToken;
  }
}
