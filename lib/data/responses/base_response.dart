import 'package:wasla/app/shared/common/common_libs.dart';

part 'base_response.g.dart';
// dart run build_runner build --delete-conflicting-outputs

abstract class BaseResponse<Data extends Object?> extends Equatable {
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

@JsonSerializable()
class BaseResponseWithOutData extends BaseResponse<Object?> {
  const BaseResponseWithOutData({
    required super.status,
    required super.message,
    required super.success,
    super.data,
  });

  //from json
  factory BaseResponseWithOutData.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseWithOutDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$BaseResponseWithOutDataToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}
