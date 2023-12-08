import 'package:wasla/app/shared/common/common_libs.dart';

final class LoginRequestBody extends Equatable {
  final String userName;
  final String password;

  const LoginRequestBody({
    required this.userName,
    required this.password,
  });

  @override
  List<Object> get props => [
        userName,
        password,
      ];
}
