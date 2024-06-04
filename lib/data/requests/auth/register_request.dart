import 'package:wasla/app/shared/common/common_libs.dart';

part 'register_request.g.dart';

@JsonSerializable()
final class RegisterRequestBody extends Equatable {
  final String userName;
  final String firstName;
  final String lastName;
  @JsonKey(name: 'phoneNumber')
  final String? phone;
  final String? email;
  final String password;

  const RegisterRequestBody({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });

  //to json
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

  @override
  List<Object?> get props => [
        userName,
        firstName,
        lastName,
        phone,
        email,
        password,
      ];
}
