import 'package:wasla/app/shared/common/common_libs.dart';

part 'confirm_email_phone.g.dart';

abstract class ConfirmContactRequestBody extends Equatable {
  final String recOtp;

  Json toJson();

  const ConfirmContactRequestBody({required this.recOtp});
}

@JsonSerializable()
class ConfirmEmailRequestBody extends ConfirmContactRequestBody {
  final String email;

  const ConfirmEmailRequestBody({required super.recOtp, required this.email});

  @override
  Json toJson() => _$ConfirmEmailRequestBodyToJson(this);

  @override
  List<Object> get props => [email, super.recOtp];
}

@JsonSerializable()
class ConfirmPhoneRequestBody extends ConfirmContactRequestBody {
  final String phone;

  const ConfirmPhoneRequestBody({required super.recOtp, required this.phone});

  @override
  Json toJson() => _$ConfirmPhoneRequestBodyToJson(this);

  @override
  List<Object> get props => [phone, super.recOtp];
}
