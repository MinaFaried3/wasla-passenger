import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/mappers/auth/login_mapper.dart';
import 'package:wasla/data/mappers/auth/register_mappers.dart';
import 'package:wasla/data/mappers/base_response_without_data_mapper.dart';
import 'package:wasla/data/mappers/home/suggestions_trips_mapper.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/requests/verification/confirm_email_phone.dart';
import 'package:wasla/data/requests/verification/edit_phone_and_email.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/base_response.dart';
import 'package:wasla/data/responses/home/suggestion_trips_response.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChecker;

  const AuthRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required LocalDataSource localDataSource,
      required NetworkChecker networkChecker})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkChecker = networkChecker;

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  RemoteDataSource get remoteDataSource => _remoteDataSource;

  @override
  LocalDataSource get localDataSource => _localDataSource;

  ///login
  @override
  FailureOrPassengerModel login(LoginRequestBody loginRequestBody) async {
    return await executeApiCall<AuthResponse, PassengerModel>(
        apiCall: () => remoteDataSource.login(loginRequestBody),
        onSuccess: (response) {
          localDataSource.setPassengerModel(response.toDomain());
          return response.toDomain();
        });
  }

  ///register
  @override
  FailureOr<CheckUsernameModel> checkUsername(String username) async {
    return await executeApiCall<CheckUsernameResponse, CheckUsernameModel>(
        apiCall: () => remoteDataSource.checkUsername(username),
        onSuccess: (response) {
          return response.toDomain();
        });
  }

  @override
  FailureOrPassengerModel register(
      RegisterRequestBody registerRequestBody) async {
    return await executeApiCall<AuthResponse, PassengerModel>(
        apiCall: () => remoteDataSource.register(registerRequestBody),
        onSuccess: (response) {
          localDataSource.setPassengerModel(response.toDomain());
          return response.toDomain();
        });
  }

  ///verification
  @override
  FailureOrBaseModel editEmail(String email) async {
    return await executeApiCall<BaseResponseWithOutData, BaseModel>(
        apiCall: () => remoteDataSource.editEmail(EditEmailRequestBody(
              refreshToken: getRefreshToken(),
              email: email,
            )),
        onSuccess: (response) {
          localDataSource.updatePassengerModelEmail(email);
          return response.toDomain();
        });
  }

  @override
  FailureOrBaseModel editPhone(String phone) async {
    return await executeApiCall<BaseResponseWithOutData, BaseModel>(
        apiCall: () => remoteDataSource.editPhone(EditPhoneRequestBody(
              refreshToken: getRefreshToken(),
              phone: phone,
            )),
        onSuccess: (response) {
          localDataSource.updatePassengerModelPhone(phone);
          return response.toDomain();
        });
  }

  @override
  FailureOrBaseModel sendVerificationEmailToPassenger() async {
    return await executeApiCall<BaseResponseWithOutData, BaseModel>(
      apiCall: () async {
        String email = await localDataSource.getPassengerEmail();
        return remoteDataSource.sendVerificationEmailToPassenger(email);
      },
      onSuccess: (response) => response.toDomain(),
    );
  }

  @override
  FailureOrBaseModel confirmEmail({required String verifyCode}) async {
    PrintManager.print(await localDataSource.getPassengerEmail(),
        color: ConsoleColor.greenBg);
    PrintManager.print((await localDataSource.getPassengerModel()).tokens.token,
        color: ConsoleColor.greenBg);
    return await executeApiCall<BaseResponseWithOutData, BaseModel>(
        apiCall: () async => remoteDataSource.confirmEmail(
              ConfirmEmailRequestBody(
                recOtp: verifyCode,
                email: await localDataSource.getPassengerEmail(),
              ),
            ),
        onSuccess: (response) {
          localDataSource.confirmPassengerEmail();
          return response.toDomain();
        });
  }

  ///---------------------------------------------------------------------------------
  ///HOME
  ///main
  @override
  FailureOr<List<SuggestionTripModel>> getSuggestionTrips() async {
    return await executeApiCall<SuggestionTripsResponse,
        List<SuggestionTripModel>>(
      apiCall: () async => remoteDataSource.getSuggestionsTrips(),
      onSuccess: (response) => response.toDomain(),
    );
  }
}
