part of 'check_username_bloc.dart';

@freezed
class CheckUsernameState with _$CheckUsernameState {
  const factory CheckUsernameState.initial() = _Initial;

  const factory CheckUsernameState.loading() = _Loading;

  const factory CheckUsernameState.valid() = _Valid;

  const factory CheckUsernameState.notValid(String message) = _NotValid;

  const factory CheckUsernameState.error(Failure failure) = _Failure;
}
