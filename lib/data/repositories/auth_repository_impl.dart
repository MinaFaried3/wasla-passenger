import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/mappers/auth/login_mapper.dart';
import 'package:wasla/data/mappers/auth/register_mappers.dart';
import 'package:wasla/data/mappers/base_response_without_data_mapper.dart';
import 'package:wasla/data/mappers/home/profile_mappers.dart';
import 'package:wasla/data/mappers/home/suggestions_trips_mapper.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/network/error/data_source_status.dart';
import 'package:wasla/data/network/network_error_handler.dart';
import 'package:wasla/data/requests/OrgTripReserveResponse.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/requests/publicTripReserveRequest.dart';
import 'package:wasla/data/requests/verification/confirm_email_phone.dart';
import 'package:wasla/data/requests/verification/edit_phone_and_email.dart';
import 'package:wasla/data/responses/IncomingTripsResponse.dart';
import 'package:wasla/data/responses/TripSeatsResponse.dart';
import 'package:wasla/data/responses/TripsSearchResponse.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/base_response.dart';
import 'package:wasla/data/responses/home/FollowRequestsResponse.dart';
import 'package:wasla/data/responses/home/main/suggestion_trips_response.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';
import 'package:wasla/domain/entities/base_model.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChecker;
  final ApiServiceClient apiServiceClient;

  const AuthRepositoryImpl(
      {required RemoteDataSource remoteDataSource,
      required LocalDataSource localDataSource,
      required NetworkChecker networkChecker,
      required this.apiServiceClient})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkChecker = networkChecker;

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  RemoteDataSource get remoteDataSource => _remoteDataSource;

  @override
  LocalDataSource get localDataSource => _localDataSource;

  Future<String> get bearerToken async {
    return "Bearer ${await getIt<AppPreferences>().getToken()}";
  }

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

  ///profile
  @override
  FailureOr<ProfileModel> getProfile() async {
    return await executeApiCall<ProfileResponse, ProfileModel>(
      apiCall: () async => remoteDataSource.getProfile(),
      onSuccess: (response) => response.toDomain(),
    );
  }

  FailureOr<PassengerItemModel> searchByUserName(
      {required String username}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.searchByUserName(
          userName: username, authorization: (await bearerToken));

      if (response.success == true) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<String> createFollowRequest({required String followerId}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.createFollowRequest(
          followerId: followerId, authorization: (await bearerToken));

      if (response.success == true) {
        return Right(response.message!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<List<FollowRequestModel>> displayFollowRequest() async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.displayFollowRequest(
          authorization: (await bearerToken));

      if (response.isSuccess == true) {
        return Right(response.data ?? []);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<String> confirmFollowRequest({required String senderId}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.confirmFollowRequest(
        senderId: senderId,
        authorization: (await bearerToken),
      );

      if (response.success == true) {
        return Right(response.message!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<String> rejectFollowRequest({required String senderId}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.rejectFollowRequest(
        senderId: senderId,
        authorization: (await bearerToken),
      );

      if (response.success == true) {
        return Right(response.message!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<TripSearchResultModel> searchForTrip({
    required String from,
    required String to,
    required String date,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.searchForTrip(
          authorization: (await bearerToken), from: from, to: to, date: date);

      if (response.isSuccess == true) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<bool> requestPublicTrip(
      {required PublicTripReserveRequest publicTripReserveRequest}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.requestPublicTrip(
        publicTripReserveRequest: publicTripReserveRequest,
        authorization: (await bearerToken),
      );

      if (response.success == true) {
        return Right(response.success!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<String> requestOrgTrip(
      {required OrgTripReserveRequest orgTripReserveRequest}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.requestOrgTrip(
        orgTripReserveRequest: orgTripReserveRequest,
        authorization: (await bearerToken),
      );

      if (response.success == true) {
        return Right(response.message!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<List<SeatModel>> getTripSeats({required String tripId}) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.getTripsSeats(
        tripId: tripId,
        authorization: (await bearerToken),
      );

      if (response.isSuccess == true) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  FailureOr<List<IncomingTripModel>> getComingTrips() async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    try {
      final response = await apiServiceClient.getComingTrips(
        authorization: (await bearerToken),
      );

      if (response.isSuccess == true) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(
          code: response.status!.toInt() ?? ApiInternalStatus.failure,
          message: response.message ?? AppStrings.defaultError,
        ));
      }
    } catch (error) {
      PrintManager.print(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
