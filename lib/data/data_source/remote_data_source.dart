import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequestBody loginRequestBody);

  Future<AuthResponse> register(RegisterRequestBody registerRequestBody);

  Future<CheckUsernameResponse> checkUsername(String userName);

  const RemoteDataSource();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiServiceClient _apiServiceClient;

  const RemoteDataSourceImpl({required ApiServiceClient apiServiceClient})
      : _apiServiceClient = apiServiceClient;

  @override
  Future<AuthResponse> login(LoginRequestBody loginRequestBody) async {
    return await _apiServiceClient.login(loginRequestBody: loginRequestBody);
  }

  @override
  Future<CheckUsernameResponse> checkUsername(String userName) async {
    return await _apiServiceClient.checkUsername(userName: userName);
  }

  @override
  Future<AuthResponse> register(RegisterRequestBody registerRequestBody) async {
    return await _apiServiceClient.register(
        registerRequestBody: registerRequestBody);
  }
}
