import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/data/network/end_points_manager.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/auth/login_response.dart';

part 'api_service_client.g.dart';

@RestApi(baseUrl: EndPointsManager.baseUrl)
abstract class ApiServiceClient {
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;

  ///auth
  ///login
  @POST(EndPointsManager.login)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<LoginResponse> login({
    @Field('userName') required String userName,
    @Field('password') required String password,
    @Field('role') String role = AppConstants.role,
  });

  ///register
  @GET(EndPointsManager.checkUsername)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<CheckUsernameResponse> checkUsername({
    @Query('userName') required String username,
  });

  ///----------------------------------------------------------------------
}
