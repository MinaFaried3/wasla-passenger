import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/data_source_status.dart';

class ErrorHandler implements Exception {
  late final Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = handleError(error);
    } else {
      failure = DataSourceStatus.defaultState.getFailure();
    }
  }
}

Failure handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSourceStatus.connectTimeout.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSourceStatus.sendTimeout.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSourceStatus.receiveTimeout.getFailure();

    case DioExceptionType.cancel:
      return DataSourceStatus.cancel.getFailure();

    case DioExceptionType.unknown:
      return DataSourceStatus.defaultState.getFailure();

    case DioExceptionType.badCertificate:
      return DataSourceStatus.badCertificate.getFailure();

    case DioExceptionType.badResponse:
      return DataSourceStatus.badResponse.getFailure();

    case DioExceptionType.connectionError:
      return DataSourceStatus.internalServerError.getFailure();
  }
}
