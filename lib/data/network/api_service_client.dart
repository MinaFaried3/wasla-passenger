import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/FollowerLocationResponse.dart';
import 'package:wasla/data/network/MapFollowersResponse.dart';
import 'package:wasla/data/network/end_points_manager.dart';
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
import 'package:wasla/data/responses/home/NotificationResponse.dart';
import 'package:wasla/data/responses/home/main/suggestion_trips_response.dart';
import 'package:wasla/data/responses/home/profile/profile_response.dart';

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
  @GET(EndPointsManager.checkUserName)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<CheckUsernameResponse> checkUsername({
    @Query('userName') required String userName,
  });

  @POST(EndPointsManager.register)
  @Headers(HeadersManager.jsonTypeHeader)
  Future<AuthResponse> register(
      {@Body() required RegisterRequestBody registerRequestBody});

  ///----------------------------------------------------------------------
  ///verification
  ///edit contacts
  @PUT(EndPointsManager.editPhone)
  Future<BaseResponseWithOutData> editPhone(
      {@Body() required EditPhoneRequestBody editPhoneRequestBody});

  @PUT(EndPointsManager.editEmail)
  Future<BaseResponseWithOutData> editEmail(
      {@Body() required EditEmailRequestBody editEmailRequestBody});

  @GET(EndPointsManager.sendEmail)
  Future<BaseResponseWithOutData> sendVerificationEmailToPassenger(
      @Path('email') String email);

  @PUT(EndPointsManager.confirmEmail)
  FutureBaseResponse confirmEmail(
      {@Header("Cookie") required String cookie,
      @Body() required ConfirmEmailRequestBody confirmEmailRequestBody});

  ///----------------------------------------------------------------------------
//////Home

  ///main screen
  @GET(EndPointsManager.tripSuggestions)
  Future<SuggestionTripsResponse> getSuggestionTrips({
    @Header("Authorization") required String authorization,
  });

  @GET(EndPointsManager.searchByUserName)
  Future<PassengerItemResponse> searchByUserName({
    @Header("Authorization") required String authorization,
    @Query('userName') required String userName,
  });

  @GET(EndPointsManager.getNotification)
  Future<NotificationResponse> getNotification({
    @Header("Authorization") required String authorization,
  });

  ///follow
  @POST(EndPointsManager.createFollowRequest)
  Future<BaseResponseWithOutData> createFollowRequest({
    @Header("Authorization") required String authorization,
    @Field("followerId") required String followerId,
  });

  @GET(EndPointsManager.displayFollowRequest)
  Future<FollowRequestsResponse> displayFollowRequest({
    @Header("Authorization") required String authorization,
  });

  @POST('/passanger/ConfirmFollowRequest')
  Future<BaseResponseWithOutData> confirmFollowRequest({
    @Header("Authorization") required String authorization,
    @Query('senderId') required String senderId,
  });

  @DELETE('/passanger/rejectFollowRequest')
  Future<BaseResponseWithOutData> rejectFollowRequest({
    @Header("Authorization") required String authorization,
    @Field('senderId') required String senderId,
  });

  ///-------------------------------------------------
  ///profile
  @GET(EndPointsManager.profile)
  Future<ProfileResponse> getProfile({
    @Header("Authorization") required String authorization,
  });

  @PUT(EndPointsManager.editProfile)
  @MultiPart()
  Future<BaseResponseWithOutData> editProfile({
    @Header("Authorization") required String authorization,
    @Part(name: 'FirstName') required String firstname,
    @Part(name: 'LastName') required String lastname,
    @Part(name: 'UserName') required String username,
    @Part(name: 'Email') required String email,
    @Part(name: 'PhoneNumber') required String phone,
    @Part(name: 'Gender') required String gender,
    @Part(name: 'Birthdate') required String birthdate,
    @Part(name: 'Photo') File? profileImage,
  });

  ///

  @GET(EndPointsManager.searchTrip)
  Future<TripsSearchResponse> searchForTrip({
    @Header("Authorization") required String authorization,
    @Path('from') required String from,
    @Path('to') required String to,
    @Query('date') required String date,
    @Query('time') required String time,
  });

  @POST('/passanger/reqeustPublicTrip')
  Future<BaseResponseWithOutData> requestPublicTrip({
    @Header("Authorization") required String authorization,
    @Body() required PublicTripReserveRequest publicTripReserveRequest,
  });

  @GET('/passanger/tripSeats/{tripId}')
  Future<TripSeatsResponse> getTripsSeats({
    @Header("Authorization") required String authorization,
    @Path('tripId') required String tripId,
  });

  @POST('/passanger/trip/reserve')
  Future<BaseResponseWithOutData> requestOrgTrip({
    @Header("Authorization") required String authorization,
    @Body() required OrgTripReserveRequest orgTripReserveRequest,
  });

  @GET('/passanger/incomingTrips')
  Future<IncomingTripsResponse> getComingTrips({
    @Header("Authorization") required String authorization,
  });

  @GET('/passanger/followerTrips')
  Future<MapFollowersResponse> getFollowerTrips({
    @Header("Authorization") required String authorization,
  });

  @GET('/passanger/getFollowerLocation/{userId}')
  Future<FollowerLocationResponse> getFollowerLocation({
    @Header("Authorization") required String authorization,
    @Path("userId") required String userId,
  });
}
