import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

abstract class NetworkChecker extends Equatable {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl extends NetworkChecker {
  final InternetConnectionChecker _connectionChecker;

  NetworkCheckerImpl({required InternetConnectionChecker connectionChecker})
      : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;

  @override
  List<Object> get props => [
        isConnected,
        _connectionChecker,
      ];
}
