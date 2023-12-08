part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.emptyUsername() = _EmpyUsername;

  const factory LoginState.emptyPassword() = _EmptyPassword;

  const factory LoginState.emptyUsernameAndPassword() =
      _EmptyUsernameAndPassword;

  const factory LoginState.success({required PassengerModel loginModel}) =
      _Success;

  const factory LoginState.error({required Failure failure}) = _Error;
}
