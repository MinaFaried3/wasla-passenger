import 'package:wasla/app/shared/common/common_libs.dart';

class BearDialogCubit extends Cubit<String> {
  BearDialogCubit() : super(AppStrings.welcomeDialog);

  void writeMessage(String message) {
    emit(message);
  }

  void loginWelcomeMsg() {
    emit(AppStrings.loginWelcomeDialog.tr());
  }

  void usernameFieldFocusedMsg() {
    emit(AppStrings.usernameFieldFocused.tr());
  }

  void usernameFieldEmptyMsg() {
    emit(AppStrings.usernameFieldEmpty.tr());
  }

  void passwordFieldEmptyMsg() {
    emit(AppStrings.passwordFieldEmpty.tr());
  }

  void usernameAndPasswordFieldEmptyMsg() {
    emit(AppStrings.usernameAndPasswordFieldEmpty.tr());
  }

  void loginErrorMsg() {
    emit(AppStrings.loginError.tr());
  }

  void loginSuccessMsg(String name) {
    emit('${AppStrings.loginSuccess.tr()} $name');
  }

  void forgetPasswordInfo() {
    emit(AppStrings.forgetPasswordInfo.tr());
  }
}
