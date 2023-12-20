class AppConstants {
  static const role = 'Passenger';

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
  static const int minPasswordLength = 8;

  static const String emailSample = 'example@gmail.com';

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

  /*
  * ^                               start anchor
    (?=(.*[a-z]){2,})               lowercase letters. {2,} indicates that you want 2 of this group
    (?=(.*[A-Z]){1,})               uppercase letters. {1,} indicates that you want 1 of this group
    (?=(.*[0-9]){1,})               numbers. {1,} indicates that you want 1 of this group
    (?=(.*[!@#$%^&*()\-__+.]){1,})  all the special characters in the [] fields. The ones used by regex are escaped by using the \ or the character itself. {1,} is redundant, but good practice, in case you change that to more than 1 in the future. Also keeps all the groups consistent
    {8,}                            indicates that you want 8 or more
    $                               end anchor
  * */
  static const String passwordSubmittedRegexSource =
      r'^(?=(.*[a-z]){2,})(?=(.*[0-9]){1,}).{8,}$';

  static final RegExp usernameRegEx = RegExp(
      r'^(?!.*[._]{2})[a-z0-9](?:[a-z0-9]|(?:_(?=[a-z0-9]))|(?:\.(?=[a-z0-9]))){0,28}[a-z0-9]$');
  static final RegExp emailEditingRegEx = RegExp(emailEditingRegExSource);
  static final RegExp emailSubmittedRegEx = RegExp(emailSubmittedRegExSource);
  static final RegExp phoneEditingRegEx = RegExp(phoneNumberEditingRegexSource);
  static final RegExp phoneSubmittedRegEx =
      RegExp(phoneNumberSubmittedRegexSource);
  static final RegExp passwordRegEx = RegExp(passwordSubmittedRegexSource);
}

class DurationManager {
  static const int timeOutMin = 2;
  static const int bearHandsDownMS = 600;

  static const Duration apiTimeOut = Duration(minutes: timeOutMin);
  static const Duration bearHandsDownDuration =
      Duration(milliseconds: bearHandsDownMS);

  static const Duration s1 = Duration(seconds: 1);
  static const Duration s2 = Duration(seconds: 2);
  static const Duration s3 = Duration(seconds: 3);
  static const Duration s4 = Duration(seconds: 4);

  static const Duration m300 = Duration(milliseconds: 300);
  static const Duration m500 = Duration(milliseconds: 500);
  static const Duration m750 = Duration(milliseconds: 750);
  static const Duration m3500 = Duration(milliseconds: 3500);
}
