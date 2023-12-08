part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = _Loading;

  const factory RegisterState.passwordInvalid(String warningMessage) =
      _passwordInvalid;

  const factory RegisterState.success(
      {required PassengerModel passengerModel}) = _Success;

  const factory RegisterState.error({required Failure failure}) = _Error;
}
