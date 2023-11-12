import 'package:wasla/app/shared/common/common_libs.dart';

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 409;
}

enum DataSourceStatus {
  success(
    200,
    AppStrings.success,
  ), //success with data
  noContent(
    201,
    AppStrings.success,
  ), // success with no data (no content,)
  badRequest(
    400,
    AppStrings.badRequestError,
  ), // failure, API rejected request
  badResponse(
    444,
    AppStrings.defaultError,
  ),
  badCertificate(
    495,
    AppStrings.defaultError,
  ), // failure, API rejected request
  forbidden(
    403,
    AppStrings.forbiddenError,
  ), //  failure, API rejected request
  unauthorized(
    401,
    AppStrings.unauthorizedError,
  ), // failure, user is not authorised
  notFound(
    404,
    AppStrings.notFoundError,
  ), // failure, not found
  sendTimeout(
    408,
    AppStrings.timeoutError,
  ),
  internalServerError(
    500,
    AppStrings.internalServerError,
  ), // failure, crash in server side

  //local status code
  connectTimeout(
    -1,
    AppStrings.timeoutError,
  ),
  cancel(
    -2,
    AppStrings.defaultError,
  ),
  receiveTimeout(
    -3,
    AppStrings.timeoutError,
  ),
  cacheError(
    -4,
    AppStrings.cacheError,
  ),
  noInternetConnection(
    -5,
    AppStrings.noInternetError,
  ),
  defaultState(
    -6,
    AppStrings.defaultError,
  );

  final int code;
  final String message;

  const DataSourceStatus(
    this.code,
    this.message,
  );
}

extension DataSourceExtension on DataSourceStatus {
  Failure getFailure() {
    switch (this) {
      case DataSourceStatus.success:
        return ServerFailure(
          code: DataSourceStatus.success.code,
          message: DataSourceStatus.success.message.tr(),
        );

      case DataSourceStatus.noContent:
        return ServerFailure(
          code: DataSourceStatus.noContent.code,
          message: DataSourceStatus.noContent.message.tr(),
        );

      case DataSourceStatus.badRequest:
        return ServerFailure(
          code: DataSourceStatus.badRequest.code,
          message: DataSourceStatus.badRequest.message.tr(),
        );

      case DataSourceStatus.forbidden:
        return ServerFailure(
          code: DataSourceStatus.forbidden.code,
          message: DataSourceStatus.forbidden.message.tr(),
        );

      case DataSourceStatus.unauthorized:
        return ServerFailure(
          code: DataSourceStatus.unauthorized.code,
          message: DataSourceStatus.unauthorized.message.tr(),
        );

      case DataSourceStatus.notFound:
        return ServerFailure(
          code: DataSourceStatus.notFound.code,
          message: DataSourceStatus.notFound.message.tr(),
        );

      case DataSourceStatus.internalServerError:
        return ServerFailure(
          code: DataSourceStatus.internalServerError.code,
          message: DataSourceStatus.internalServerError.message.tr(),
        );

      case DataSourceStatus.connectTimeout:
        return ServerFailure(
          code: DataSourceStatus.connectTimeout.code,
          message: DataSourceStatus.connectTimeout.message.tr(),
        );

      case DataSourceStatus.cancel:
        return ServerFailure(
          code: DataSourceStatus.cancel.code,
          message: DataSourceStatus.cancel.message.tr(),
        );

      case DataSourceStatus.sendTimeout:
        return ServerFailure(
          code: DataSourceStatus.sendTimeout.code,
          message: DataSourceStatus.sendTimeout.message.tr(),
        );
      case DataSourceStatus.badResponse:
        return ServerFailure(
          code: DataSourceStatus.badResponse.code,
          message: DataSourceStatus.badResponse.message.tr(),
        );
      case DataSourceStatus.badCertificate:
        return ServerFailure(
          code: DataSourceStatus.badCertificate.code,
          message: DataSourceStatus.badCertificate.message.tr(),
        );
      case DataSourceStatus.cacheError:
        return Failure(
          code: DataSourceStatus.cacheError.code,
          message: DataSourceStatus.cacheError.message.tr(),
        );

      case DataSourceStatus.noInternetConnection:
        return Failure(
          code: DataSourceStatus.noInternetConnection.code,
          message: DataSourceStatus.noInternetConnection.message.tr(),
        );

      case DataSourceStatus.receiveTimeout:
        return Failure(
          code: DataSourceStatus.receiveTimeout.code,
          message: DataSourceStatus.receiveTimeout.message.tr(),
        );
      case DataSourceStatus.defaultState:
        return Failure(
          code: DataSourceStatus.defaultState.code,
          message: DataSourceStatus.defaultState.message.tr(),
        );
    }
  }
}
