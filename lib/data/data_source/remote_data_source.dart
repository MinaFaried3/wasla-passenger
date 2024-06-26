import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/requests/home/profile/edit_profile_request.dart';
import 'package:wasla/data/requests/verification/confirm_email_phone.dart';
import 'package:wasla/data/requests/verification/edit_phone_and_email.dart';
import 'package:wasla/data/responses/auth/auth_response.dart';
import 'package:wasla/data/responses/auth/check_username_response.dart';
import 'package:wasla/data/responses/base_response.dart';
import 'package:wasla/data/responses/home/NotificationResponse.dart';
import 'package:wasla/data/responses/home/main/suggestion_trips_response.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequestBody loginRequestBody);

  Future<AuthResponse> register(RegisterRequestBody registerRequestBody);

  Future<CheckUsernameResponse> checkUsername(String userName);

  Future<BaseResponseWithOutData> editEmail(
      EditEmailRequestBody editEmailRequestBody);

  Future<BaseResponseWithOutData> editPhone(
      EditPhoneRequestBody editPhoneRequestBody);

  Future<BaseResponseWithOutData> sendVerificationEmailToPassenger(
      String email);

  FutureBaseResponse confirmEmail(
      ConfirmEmailRequestBody confirmEmailRequestBody);

  Future<SuggestionTripsResponse> getSuggestionsTrips();

  Future<ProfileResponse> getProfile();

  Future<BaseResponseWithOutData> editProfile(
      EditProfileRequest editProfileRequest);

  Future<NotificationResponse> getNotification();

  const RemoteDataSource();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiServiceClient _apiServiceClient;
  final AppPreferences _appPreferences;

  const RemoteDataSourceImpl(
      {required ApiServiceClient apiServiceClient,
      required AppPreferences appPreferences})
      : _apiServiceClient = apiServiceClient,
        _appPreferences = appPreferences;

  Future<String> get bearerToken async {
    return "Bearer ${await _appPreferences.getToken()}";
  }

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

  @override
  Future<BaseResponseWithOutData> editEmail(
      EditEmailRequestBody editEmailRequestBody) async {
    return await _apiServiceClient.editEmail(
        editEmailRequestBody: editEmailRequestBody);
  }

  @override
  Future<BaseResponseWithOutData> editPhone(
      EditPhoneRequestBody editPhoneRequestBody) async {
    return await _apiServiceClient.editPhone(
        editPhoneRequestBody: editPhoneRequestBody);
  }

  @override
  Future<BaseResponseWithOutData> sendVerificationEmailToPassenger(
      String email) async {
    return await _apiServiceClient.sendVerificationEmailToPassenger(email);
  }

  @override
  FutureBaseResponse confirmEmail(
      ConfirmEmailRequestBody confirmEmailRequestBody) async {
    return await _apiServiceClient.confirmEmail(
        cookie: 'storeOtp=${confirmEmailRequestBody.recOtp}',
        confirmEmailRequestBody: confirmEmailRequestBody);
  }

  @override
  Future<SuggestionTripsResponse> getSuggestionsTrips() async {
    return await _apiServiceClient.getSuggestionTrips(
        authorization: await bearerToken);
  }

  @override
  Future<ProfileResponse> getProfile() async {
    return await _apiServiceClient.getProfile(authorization: await bearerToken);
  }

  @override
  Future<BaseResponseWithOutData> editProfile(
      EditProfileRequest editProfileRequest) async {
    return await _apiServiceClient.editProfile(
        authorization: await bearerToken,
        firstname: editProfileRequest.firstname,
        lastname: editProfileRequest.lastname,
        username: editProfileRequest.username,
        email: editProfileRequest.email,
        phone: editProfileRequest.phone,
        gender: editProfileRequest.gender,
        birthdate: editProfileRequest.birthdate,
        profileImage: editProfileRequest.profileImage);
  }

  @override
  Future<NotificationResponse> getNotification() async {
    return await _apiServiceClient.getNotification(
        authorization: await bearerToken);
  }
}
