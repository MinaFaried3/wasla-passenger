import 'package:wasla/app/shared/common/common_libs.dart';

class LoginRequestBody extends Equatable {
  final String phone;
  final String password;

  const LoginRequestBody({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [
        phone,
        password,
      ];
}
