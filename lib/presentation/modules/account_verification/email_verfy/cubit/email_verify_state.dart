part of 'email_verify_cubit.dart';

@freezed
class EmailVerifyState with _$EmailVerifyState {
  const factory EmailVerifyState.initial() = _Initial;

  const factory EmailVerifyState.sendingEmailLoadingState() =
      _SendingEmailLoading;

  const factory EmailVerifyState.sendingEmailSuccessState() =
      _SendingEmailSuccess;

  const factory EmailVerifyState.sendingEmailErrorState(String errorMessage) =
      _SendingEmailError;

  const factory EmailVerifyState.confirmEmailLoadingState() =
      _ConfirmEmailLoading;

  const factory EmailVerifyState.confirmEmailSuccessState(String message) =
      _ConfirmEmailSuccess;

  const factory EmailVerifyState.confirmEmailErrorState(String errorMessage) =
      _ConfirmEmailError;
}
