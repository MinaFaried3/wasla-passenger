import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/data/responses/base_response.dart';
import 'package:wasla/domain/entities/base_model.dart';

extension BaseResponseWithoutDataMapper on BaseResponseWithOutData {
  BaseModel toDomain() => BaseModel(
        success: success.orFalse(),
        message: message.orEmpty(),
      );
}
