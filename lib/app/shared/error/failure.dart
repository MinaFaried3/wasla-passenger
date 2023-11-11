import 'package:wasla/app/shared/common/common_libs.dart';

class Failure extends Equatable {
  final String message;
  final int code;

  const Failure({required this.message, required this.code});

  @override
  List<Object> get props => [message, code];
}
