part of 'username_validation_cubit.dart';

@freezed
class UsernameValidatorState with _$UsernameValidatorState {
  const factory UsernameValidatorState.initial() = _Initial;

  const factory UsernameValidatorState.loading() = _loading;

  const factory UsernameValidatorState.valid() = _Valid;

  const factory UsernameValidatorState.notValid(String message) = _NotValid;

  const factory UsernameValidatorState.error(Failure failure) = _Failure;
}
