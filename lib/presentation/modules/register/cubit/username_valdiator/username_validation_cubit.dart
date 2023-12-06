import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/auth_usecases/check_username_usecase.dart';

part 'username_validation_cubit.freezed.dart';
part 'username_validation_state.dart';

class UsernameValidatorCubit extends Cubit<UsernameValidatorState> {
  final CheckUsernameUseCase _checkUsernameUseCase;

  UsernameValidatorCubit(this._checkUsernameUseCase)
      : super(const UsernameValidatorState.initial());

  void validate(String username) async {
    //loading
    emit(const UsernameValidatorState.loading());

    if (username.isEmpty) {
      //todo app strings
      emit(const UsernameValidatorState.notValid('الكلمة غبر صحيحة'));
      return;
    }

    if (!_validateRegex(username)) {
      emit(const UsernameValidatorState.notValid('الكلمة غبر صحيحة بالمقياس'));
    }

    final result = await _checkUsernameUseCase(username);

    result.fold(
      (failure) {
        emit(UsernameValidatorState.error(failure));
      },
      (checkUsernameModel) {
        if (checkUsernameModel.valid == true) {
          emit(const UsernameValidatorState.valid());
        } else {
          emit(UsernameValidatorState.notValid(checkUsernameModel.message));
        }
      },
    );
  }

  bool _validateRegex(String username) {
    //Todo
    return true;
  }
}
