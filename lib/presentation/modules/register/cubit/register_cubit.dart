import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/data/requests/auth/register_request.dart';
import 'package:wasla/domain/usecases/auth_usecases/register_usecase.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(const RegisterState.initial());

  void register(
      RegisterRequestBody registerRequestBody, String confirmPassword) {
    final validatePasswords = _validatePasswords(
      password: registerRequestBody.password,
      confirmPassword: confirmPassword,
    );

    if (validatePasswords == false) {
      return;
    }

    _register(registerRequestBody);
  }

  void _register(RegisterRequestBody registerRequestBody) async {
    emit(const RegisterState.loading());

    final result = await _registerUseCase(registerRequestBody);

    result.fold(
      (failure) => emit(RegisterState.error(failure: failure)),
      (passengerModel) {
        emit(RegisterState.success(passengerModel: passengerModel));

        //save tokens data to shared pref
        getIt<AppPreferences>()
          ..saveTokensData(tokens: passengerModel.tokens)
          ..setData<bool>(key: PrefKeys.isRegistered, data: true);
      },
    );
  }

  bool _validatePasswords({
    required String password,
    required String confirmPassword,
  }) {
    if (password != confirmPassword) {
      emit(const RegisterState.passwordInvalid(
          AppStrings.confirmPasswordInvalid));
      return false;
    }

    if (password.length < AppConstants.minPasswordLength) {
      emit(const RegisterState.passwordInvalid(
          AppStrings.passwordLengthInvalid));
      return false;
    }

    if (!_isValidPassword(password)) {
      return false;
    }

    return true;
  }

  bool _isValidPassword(String password) {
    final bool valid = const PasswordSubmitRegexValidator().isValid(password);

    if (!valid) {
      emit(const RegisterState.passwordInvalid(AppStrings.passwordInfo));
      return false;
    }

    return true;
  }
}
