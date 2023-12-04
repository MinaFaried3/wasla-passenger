import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/shared/common/constants.dart';

part 'username_validation_cubit.freezed.dart';
part 'username_validation_state.dart';

class UsernameValidatorCubit extends Cubit<UsernameValidatorState> {
  UsernameValidatorCubit() : super(const UsernameValidatorState.initial());

  void validate(String username) async {
    //loading
    emit(const UsernameValidatorState.loading());

    if (username.isEmpty) {
      //todo app strings
      emit(const UsernameValidatorState.notValid('الكلمة غبر صحيحة بالمقياس'));
      return;
    }

    if (!_validateRegex(username)) {
      emit(const UsernameValidatorState.notValid('الكلمة غبر صحيحة بالمقياس'));
    }

    bool valid = await _validateFormUseCase(username);

    if (valid) {
      emit(const UsernameValidatorState.valid());
    } else {
      emit(const UsernameValidatorState.notValid('ماخوذ بالفعل'));
    }
  }

  bool _validateRegex(String username) {
    //Todo
    return true;
  }

  Future<bool> _validateFormUseCase(String username) async {
    await Future.delayed(DurationManager.m500);

    //todo
    return true;
  }
}
