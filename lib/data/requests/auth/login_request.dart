import 'package:wasla/app/shared/common/common_libs.dart';

part 'login_request.g.dart';

@JsonSerializable()
final class LoginRequestBody extends Equatable {
  final String userName;
  final String password;
  final String role;

  const LoginRequestBody(
      {required this.userName,
      required this.password,
      this.role = AppConstants.role});

  //to json
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

  @override
  List<Object> get props => [
        userName,
        password,
      ];
}
