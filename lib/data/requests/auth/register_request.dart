import 'package:equatable/equatable.dart';

final class RegisterRequestBody extends Equatable {
  final String username;
  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String password;

  const RegisterRequestBody({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        firstname,
        lastname,
        phone,
        email,
        password,
      ];
}
