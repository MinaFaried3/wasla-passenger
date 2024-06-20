import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/repositories/base_repository.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/data/requests/home/profile/edit_profile_request.dart';
import 'package:wasla/domain/entities/auth/check_username_model.dart';
import 'package:wasla/domain/entities/home/notification_model.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';

abstract class AuthRepository extends BaseRepository {
  ///login
  FailureOrPassengerModel login(LoginRequestBody loginRequestBody);

  ///register
  FailureOrPassengerModel register(RegisterRequestBody registerRequestBody);

  FailureOr<CheckUsernameModel> checkUsername(String username);

  ///verification
  FailureOrBaseModel editEmail(String email);

  FailureOrBaseModel editPhone(String phone);

  FailureOrBaseModel sendVerificationEmailToPassenger();

  FailureOrBaseModel confirmEmail({required String verifyCode});

  ///home
  ///main
  FailureOr<List<SuggestionTripModel>> getSuggestionTrips();

  FailureOrList<NotificationModel> getNotification();

  ///profile
  FailureOr<ProfileModel> getProfile();

  FailureOrBaseModel editProfile(
      {required EditProfileRequest editProfileRequest});

  const AuthRepository();
}
