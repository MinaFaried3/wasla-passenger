import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/shared/common/constants.dart';

//todo
//not working
class EmailEditingRegexValidator extends RegexValidator {
  const EmailEditingRegexValidator(
      {super.regexSource = AppConstants.emailEditingRegExSource});
}

class EmailSubmitRegexValidator extends RegexValidator {
  const EmailSubmitRegexValidator(
      {super.regexSource = AppConstants.emailSubmittedRegExSource});
}
