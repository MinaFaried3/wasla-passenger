import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/mappers/login_mapper.dart';
import 'package:wasla/data/responses/login_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkChecker _networkChecker;

  const AuthRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required NetworkChecker networkChecker})
      : _remoteDataSource = remoteDataSource,
        _networkChecker = networkChecker;

  @override
  Future<Either<Failure, LoginModel>> login(
      LoginRequestBody loginRequestBody) async {
    if (await _networkChecker.isConnected == false) {
      //TODO content
      return const Left(Failure(
        code: 0,
        message: "",
      ));
    }

    final LoginResponse response =
        await _remoteDataSource.login(loginRequestBody);

    if (response.status == 200) {
      return Right(response.toDomain());
    } else {
      //TODO content
      return Left(ServerFailure(
        code: response.status.orZero(),
        message: response.message.orEmpty(),
      ));
    }
  }
}
