part of 'check_username_bloc.dart';

@freezed
class CheckUsernameEvent with _$CheckUsernameEvent {
  const factory CheckUsernameEvent.check(String username) = _CheckUsername;
}
