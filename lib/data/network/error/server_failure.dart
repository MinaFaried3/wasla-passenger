import 'package:wasla/app/shared/common/common_libs.dart';

final class ServerFailure extends Failure {
  const ServerFailure({
    required super.code,
    required super.message,
  });

  @override
  List<Object> get props => [message, code];
}
