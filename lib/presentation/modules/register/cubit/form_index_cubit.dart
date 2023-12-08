import 'package:bloc/bloc.dart';
import 'package:wasla/app/shared/common/constants.dart';

class FormIndexCubit extends Cubit<int> {
  FormIndexCubit() : super(AppConstants.zero);

  int _index = AppConstants.zero;

  bool nextForm({int limit = 3}) {
    if (_index < limit - 1) {
      _index++;
      emit(_index);
      return true;
    }
    return false;
  }

  bool previousForm() {
    if (_index > 0) {
      _index--;
      emit(_index);
      return true;
    }
    return false;
  }
}
