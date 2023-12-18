import 'package:retrofit/http.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/end_points_manager.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';

part 'api_service_client.g.dart';

@RestApi(baseUrl: EndPointsManager.baseUrl)
abstract class ApiServiceClient {
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;

  ///auth
  ///login
  @POST(EndPointsManager.login)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<AuthResponse> login(
      {@Body() required LoginRequestBody loginRequestBody});

  ///register
  @GET(EndPointsManager.checkUsername)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<CheckUsernameResponse> checkUsername({
    @Query('userName') required String userName,
  });

  @POST(EndPointsManager.register)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<AuthResponse> register(
      {@Body() required RegisterRequestBody registerRequestBody});

  ///----------------------------------------------------------------------
}
