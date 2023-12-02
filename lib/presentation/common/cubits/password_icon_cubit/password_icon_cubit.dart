import 'package:wasla/app/shared/common/common_libs.dart';

part 'password_icon_cubit.freezed.dart';
part 'password_icon_state.dart';

class PasswordIconCubit extends Cubit<PasswordIconState> {
  PasswordIconCubit()
      : super(const PasswordIconState.closedIcon(
            AssetsProvider.closedEyeIcon, true));

  bool _isClosed = true;

  bool get isClosedIcon => _isClosed;

  void toggleOpenCloseIcon() {
    _isClosed = !_isClosed;
    if (_isClosed) {
      emit(PasswordIconState.closedIcon(
          AssetsProvider.closedEyeIcon, _isClosed));
    } else {
      emit(PasswordIconState.shownIcon(AssetsProvider.openEyeIcon, _isClosed));
    }
  }
}
