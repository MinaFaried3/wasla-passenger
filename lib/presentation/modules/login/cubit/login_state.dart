part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.success({required LoginModel loginModel}) = _Success;

  const factory LoginState.error({required Failure failure}) = _Error;
}
