class AppConstants {
  static const zero = 0;
  static const one = 1;
  static const doubleZero = 0.0;
  static const thousands = 1000;
  static const String emptyString = "";
  static const List emptyList = [];
  static const Set emptySet = {};
  static const Map emptyMap = {};

  static const double screenUtilWidth = 428;
  static const double screenUtilHeight = 926;

  //todo
  static const String token = "";
}

class DurationManager {
  static const int timeOutMin = 2;
  static const int bearHandsDownMS = 750;

  static const Duration apiTimeOut = Duration(minutes: timeOutMin);
  static const Duration bearHandsDownDuration =
      Duration(milliseconds: bearHandsDownMS);

  static const Duration s4 = Duration(seconds: 4);
  static const Duration s3 = Duration(seconds: 3);
}
