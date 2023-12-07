part of 'package:wasla/app/services/validator/string_validator.dart';

class EmailEditingRegexValidator extends RegexValidator {
  const EmailEditingRegexValidator(
      {super.regexSource = AppConstants.emailEditingRegExSource});
}

class EmailSubmitRegexValidator extends RegexValidator {
  const EmailSubmitRegexValidator(
      {super.regexSource = AppConstants.emailSubmittedRegExSource});
}

class PhoneNumberEditingRegexValidator extends RegexValidator {
  const PhoneNumberEditingRegexValidator(
      {super.regexSource = AppConstants.phoneNumberEditingRegexSource});
}

class PhoneNumberSubmitRegexValidator extends RegexValidator {
  const PhoneNumberSubmitRegexValidator(
      {super.regexSource = AppConstants.phoneNumberSubmittedRegexSource});
}

class PasswordSubmitRegexValidator extends RegexValidator {
  const PasswordSubmitRegexValidator(
      {super.regexSource = AppConstants.passwordSubmittedRegexSource});
}
