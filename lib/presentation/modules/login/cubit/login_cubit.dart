import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/auth_usecases/login_usecase.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

final class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

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

  void login({
    required String phone,
    required String password,
  }) {
    if (phone.isEmpty || password.isEmpty) {
      //todo
      emit(const LoginState.error(
          failure: Failure(message: "wrong password or email", code: -2)));
      return;
    }

    _login(userName: phone, password: password);
  }
}
