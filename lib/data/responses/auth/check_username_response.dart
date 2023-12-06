import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wasla/data/responses/base_response.dart';

part 'check_username_response.g.dart';

@JsonSerializable()
class CheckUsernameResponse extends BaseResponse<CheckUsernameData> {
  const CheckUsernameResponse({
    super.status,
    super.message,
    super.success,
    super.data,
  });

  //from json
  factory CheckUsernameResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckUsernameResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CheckUsernameResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}

@JsonSerializable()
class CheckUsernameData extends Equatable {
  @JsonKey(name: 'valid')
  final bool? valid;
  @JsonKey(name: 'message')
  final String? message;

  const CheckUsernameData({
    this.valid,
    this.message,
  });

  //from json
  factory CheckUsernameData.fromJson(Map<String, dynamic> json) =>
      _$CheckUsernameDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CheckUsernameDataToJson(this);

  @override
  List<Object?> get props => [
        valid,
        message,
      ];
}
