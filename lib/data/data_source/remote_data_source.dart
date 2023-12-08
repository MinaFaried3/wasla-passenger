import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequestBody loginRequestBody);

  Future<AuthResponse> register(RegisterRequestBody registerRequestBody);

  Future<CheckUsernameResponse> checkUsername(String username);

  const RemoteDataSource();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiServiceClient _apiServiceClient;

  const RemoteDataSourceImpl({required ApiServiceClient apiServiceClient})
      : _apiServiceClient = apiServiceClient;

  @override
  Future<AuthResponse> login(LoginRequestBody loginRequestBody) async {
    return await _apiServiceClient.login(
        username: loginRequestBody.userName,
        password: loginRequestBody.password);
  }

  @override
  Future<CheckUsernameResponse> checkUsername(String username) async {
    return await _apiServiceClient.checkUsername(username: username);
  }

  @override
  Future<AuthResponse> register(RegisterRequestBody registerRequestBody) async {
    return await _apiServiceClient.register(
      username: registerRequestBody.username,
      firstname: registerRequestBody.firstname,
      lastname: registerRequestBody.lastname,
      phone: registerRequestBody.phone,
      email: registerRequestBody.email,
      password: registerRequestBody.password,
    );
  }
}
