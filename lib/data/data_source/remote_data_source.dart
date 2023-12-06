import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/auth/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequestBody loginRequestBody);

  Future<CheckUsernameResponse> checkUsername(String username);

  const RemoteDataSource();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiServiceClient _apiServiceClient;

  const RemoteDataSourceImpl({required ApiServiceClient apiServiceClient})
      : _apiServiceClient = apiServiceClient;

  @override
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    return await _apiServiceClient.login(
        userName: loginRequestBody.userName,
        password: loginRequestBody.password);
  }

  @override
  Future<CheckUsernameResponse> checkUsername(String username) async {
    return await _apiServiceClient.checkUsername(username: username);
  }
}
