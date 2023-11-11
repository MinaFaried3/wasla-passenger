import 'package:wasla/app/shared/common/common_libs.dart';

class LoginModel extends Equatable {
  final bool isAuthenticated;

  final String email;

  final String phone;

  final String role;

  final String expiresOn;

  final String token;

  final String refreshToken;

  final String refreshTokenExpiresOn;

  const LoginModel({
    required this.isAuthenticated,
    required this.email,
    required this.phone,
    required this.role,
    required this.expiresOn,
    required this.token,
    required this.refreshToken,
    required this.refreshTokenExpiresOn,
  });

  @override
  List<Object> get props => [
        isAuthenticated,
        email,
        phone,
        role,
        expiresOn,
        token,
        refreshToken,
        refreshTokenExpiresOn,
      ];
}
