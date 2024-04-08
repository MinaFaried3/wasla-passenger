import 'package:wasla/app/shared/common/common_libs.dart';

part 'edit_phone_and_email.g.dart';

abstract class BaseEditContactRequestBody extends Equatable {
  @JsonKey(name: 'reftoken')
  final String refreshToken;

  const BaseEditContactRequestBody({required this.refreshToken});
}

@JsonSerializable()
class EditPhoneRequestBody extends BaseEditContactRequestBody {
  final String phone;

  const EditPhoneRequestBody({
    required super.refreshToken,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$EditPhoneRequestBodyToJson(this);

  @override
  List<Object> get props => [
        refreshToken,
        phone,
      ];
}

@JsonSerializable()
class EditEmailRequestBody extends BaseEditContactRequestBody {
  final String email;

  const EditEmailRequestBody({
    required super.refreshToken,
    required this.email,
  });

  Map<String, dynamic> toJson() => _$EditEmailRequestBodyToJson(this);

  @override
  List<Object> get props => [
        refreshToken,
        email,
      ];
}
