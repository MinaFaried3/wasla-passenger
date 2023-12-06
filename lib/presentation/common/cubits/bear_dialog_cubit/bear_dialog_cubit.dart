import 'package:wasla/app/shared/common/common_libs.dart';

class BearDialogCubit extends Cubit<String> {
  BearDialogCubit() : super(AppStrings.welcomeDialog);

  void writeMessage(String message) {
    emit(message);
  }

  void welcomeMsg() {
    emit(AppStrings.welcomeDialog);
  }

  void usernameFieldFocusedMsg() {
    emit(AppStrings.usernameFieldFocused);
  }

  void usernameFieldEmptyMsg() {
    emit(AppStrings.usernameFieldEmpty);
  }

  void passwordFieldEmptyMsg() {
    emit(AppStrings.passwordFieldEmpty);
  }

  void usernameAndPasswordFieldEmptyMsg() {
    emit(AppStrings.usernameAndPasswordFieldEmpty);
  }

  void loginErrorMsg() {
    emit(AppStrings.loginError);
  }

  void loginSuccessMsg() {
    emit(AppStrings.loginSuccess);
  }

  void forgetPasswordInfo() {
    emit(AppStrings.forgetPasswordInfo);
  }
}
