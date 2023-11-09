import 'package:wasla/app/shared/common/common_libs.dart';

// dart run build_runner build --delete-conflicting-outputs

abstract class BaseResponse extends Equatable {
  @JsonKey(name: "httpStatusCode")
  final int? status;
  @JsonKey(name: "errorMessage")
  final String? message;
  @JsonKey(name: "isSuccess")
  final bool? success;

  const BaseResponse({
    this.status,
    this.message,
    this.success,
  });
}
