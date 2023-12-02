import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/auth_usecases/login_usecase.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

final class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  void login({
    required String userName,
    required String password,
  }) {
    if (_validateUserNameAndPassword(userName: userName, password: password)) {
      _login(userName: userName, password: password);
    }
  }

  bool _validateUserNameAndPassword({
    required String userName,
    required String password,
  }) {
    if (userName.isEmpty && password.isEmpty) {
      emit(const LoginState.emptyUsernameAndPassword());
      return false;
    }

    if (userName.isEmpty) {
      emit(const LoginState.emptyUsername());
      return false;
    }

    if (password.isEmpty) {
      emit(const LoginState.emptyPassword());
      return false;
    }

    return true;
  }

  void _login({
    required String userName,
    required String password,
  }) async {
    emit(const LoginState.loading());

    final result = await _loginUseCase(
        LoginRequestBody(userName: userName, password: password));

    result.fold(
      (failure) {
        emit(LoginState.error(failure: failure));
      },
      (loginModel) {
        emit(LoginState.success(loginModel: loginModel));
      },
    );
  }
}
