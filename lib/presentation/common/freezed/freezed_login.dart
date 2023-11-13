import 'package:wasla/app/shared/common/common_libs.dart';

part 'freezed_login.freezed.dart';

@freezed
class LoginFreezed with _$LoginFreezed {
  factory LoginFreezed({required String phone, required String password}) =
      _LoginFreezwd;
}
