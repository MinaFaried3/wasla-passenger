import 'package:wasla/app/shared/common/common_libs.dart';

class Failure extends Equatable {
  final String message;
  final int code;

  const Failure({required this.message, required this.code});

  @override
  List<Object> get props => [message, code];
}

final class FailureCode {
  ///data [-1] to [-99]
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int cacheError = -4;
  static const int noInternetConnection = -5;
  static const int defaultState = -6;

  ///ui [-100] for [-200]
  static const int emptyInputFieldCode = -100;
}
