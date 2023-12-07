class AppConstants {
  static const role = 'passenger';

  static const zero = 0;
  static const one = 1;
  static const doubleZero = 0.0;
  static const doubleOne = 1.0;
  static const thousands = 1000;
  static const String emptyString = "";
  static const List emptyList = [];
  static const Set emptySet = {};
  static const Map emptyMap = {};

  static const int phoneNumberLength = 11;

  //todo for phone
  static const double screenUtilWidth = 428;
  static const double screenUtilHeight = 926;

  //todo
  static const String token = "";

  //regex
  static const String emailEditingRegExSource =
      '^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\\.[a-zA-Z0-9-]*)?)?)?\$';
  static const String emailSubmittedRegExSource =
      '(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-]+\$)';
  static const String phoneNumberEditingRegexSource = r"^(01)[0-9]{0,9}$";
  static const String phoneNumberSubmittedRegexSource = r"^01[0-9]{9}$";

  static final RegExp usernameRegEx = RegExp(
      r'^(?!.*[._]{2})[a-z0-9](?:[a-z0-9]|(?:_(?=[a-z0-9]))|(?:\.(?=[a-z0-9]))){0,28}[a-z0-9]$');
  static final RegExp emailEditingRegEx = RegExp(emailEditingRegExSource);
  static final RegExp emailSubmittedRegEx = RegExp(emailSubmittedRegExSource);
  static final RegExp phoneEditingRegEx = RegExp(phoneNumberEditingRegexSource);
  static final RegExp phoneSubmittedRegEx =
      RegExp(phoneNumberSubmittedRegexSource);
}

class DurationManager {
  static const int timeOutMin = 2;
  static const int bearHandsDownMS = 750;

  static const Duration apiTimeOut = Duration(minutes: timeOutMin);
  static const Duration bearHandsDownDuration =
      Duration(milliseconds: bearHandsDownMS);

  static const Duration s2 = Duration(seconds: 2);
  static const Duration s3 = Duration(seconds: 3);
  static const Duration s4 = Duration(seconds: 4);

  static const Duration m300 = Duration(milliseconds: 300);
  static const Duration m500 = Duration(milliseconds: 500);
  static const Duration m750 = Duration(milliseconds: 750);
  static const Duration m3500 = Duration(milliseconds: 3500);
}
