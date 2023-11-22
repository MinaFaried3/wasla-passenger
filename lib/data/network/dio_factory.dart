import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/data/network/end_points_manager.dart';

class DioFactory extends Equatable {
  final AppPreferences _appPreferences;
  final Dio _dio;

  const DioFactory({required AppPreferences appPreferences, required Dio dio})
      : _appPreferences = appPreferences,
        _dio = dio;

  Future<String> getLanguage() async {
    return await _appPreferences.getAppLanguage();
  }

  Future<Dio> getDio() async {
    String lang = await _appPreferences.getAppLanguage();

    Map<String, String> headers =
        HeadersManager.baseHeaders(lang, AppConstants.token);

    _dio.options = BaseOptions(
        baseUrl: EndPointsManager.baseUrl,
        headers: headers,
        sendTimeout: DurationManager.apiTimeOut,
        receiveTimeout: DurationManager.apiTimeOut,
        receiveDataWhenStatusError: true);

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          logPrint: PrintManager.printColoredText));
    }

    return _dio;
  }

  @override
  List<Object> get props => [_appPreferences];
}
