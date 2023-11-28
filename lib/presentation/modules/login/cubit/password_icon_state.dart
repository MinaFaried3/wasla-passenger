part of 'password_icon_cubit.dart';

@freezed
class PasswordIconState with _$PasswordIconState {
  const factory PasswordIconState.shownIcon(String iconPath, bool isClosed) =
      _ShownIcon;

  const factory PasswordIconState.closedIcon(String iconPath, bool isClosed) =
      _ClosedIcon;
}
