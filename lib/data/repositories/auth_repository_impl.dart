import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/mappers/auth/login_mapper.dart';
import 'package:wasla/data/mappers/auth/register_mappers.dart';
import 'package:wasla/data/network/error/data_source_status.dart';
import 'package:wasla/data/network/error/network_error_handler.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/auth/login_response.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkChecker _networkChecker;

  const AuthRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required NetworkChecker networkChecker})
      : _remoteDataSource = remoteDataSource,
        _networkChecker = networkChecker;

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  RemoteDataSource get remoteDataSource => _remoteDataSource;

  ///login
  @override
  Future<Either<Failure, LoginModel>> login(
      LoginRequestBody loginRequestBody) async {
    if (await networkChecker.isConnected == false) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }

    try {
      final LoginResponse response =
          await remoteDataSource.login(loginRequestBody);

      if (response.success == true) {
        return Right(response.toDomain());
      } else {
        return Left(
          ServerFailure(
            code: response.status ?? ApiInternalStatus.failure,
            message: response.message ?? AppStrings.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  //----------------------------------------------------------

  ///register
  @override
  Future<Either<Failure, CheckUsernameModel>> checkUsername(
      String username) async {
    if (await networkChecker.isConnected == false) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }

    try {
      final CheckUsernameResponse response =
          await remoteDataSource.checkUsername(username);

      if (response.success == true) {
        return Right(response.toDomain());
      } else {
        return Left(
          ServerFailure(
            code: response.status ?? ApiInternalStatus.failure,
            message: response.message ?? AppStrings.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
