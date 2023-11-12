import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/constants.dart';
import 'package:wasla/data/network/end_points_manager.dart';

class DioFactory extends Equatable {
  final AppPreferences _appPreferences;

  const DioFactory({required AppPreferences appPreferences})
      : _appPreferences = appPreferences;

  Future<String> getLanguage() async {
    return await _appPreferences.getAppLanguage();
  }

  Future<Dio> getDio() async {
    final Dio dio = Dio();

    String lang = await _appPreferences.getAppLanguage();

    Map<String, String> headers = {
      HeadersManager.contentType: HeadersManager.applicationJson,
      HeadersManager.accept: HeadersManager.applicationJson,
      HeadersManager.authorization: AppConstants.token, //todo
      HeadersManager.acceptLanguage: lang,
    };

    dio.options = BaseOptions(
        baseUrl: EndPointsManager.baseUrl,
        headers: headers,
        sendTimeout: AppConstants.apiTimeOut,
        receiveTimeout: AppConstants.apiTimeOut,
        receiveDataWhenStatusError: true);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          logPrint: PrintManager.printColoredText));
    }

    return dio;
  }

  @override
  List<Object> get props => [_appPreferences];
}
