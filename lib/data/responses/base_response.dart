import 'package:wasla/app/shared/common/common_libs.dart';

// dart run build_runner build --delete-conflicting-outputs

abstract class BaseResponse extends Equatable {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "isSuccess")
  final bool? success;

  const BaseResponse({
    this.status,
    this.message,
    this.success,
  });
}
