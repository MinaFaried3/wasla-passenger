import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/responses/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequestBody loginRequestBody);

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
}
