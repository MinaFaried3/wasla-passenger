import 'package:wasla/app/shared/common/common_libs.dart';

// dart run build_runner build --delete-conflicting-outputs

abstract class BaseResponse<Data> extends Equatable {
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'isSuccess')
  final bool? success;
  @JsonKey(name: 'data')
  final Data? data;

  const BaseResponse({
    required this.status,
    required this.message,
    required this.success,
    required this.data,
  });
}
