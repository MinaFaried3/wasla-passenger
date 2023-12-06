import 'package:wasla/app/shared/common/common_libs.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, RoutePredicate? predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, predicate ?? (route) => false,
        arguments: arguments);
  }

  //pop
  void pop() => Navigator.of(this).pop();

  bool canPop() => Navigator.canPop(this);
}
