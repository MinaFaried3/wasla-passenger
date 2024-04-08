import 'package:wasla/app/services/validator/string_validator.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

abstract class ValidatorManager {
  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppStrings.cannotBeEmpty.tr();
    }

    if (phone.length < AppConstants.phoneNumberLength) {
      return AppStrings.phoneLengthNotValid.tr();
    }

    final validPhone = const PhoneNumberSubmitRegexValidator().isValid(phone);
    if (!validPhone) {
      return AppStrings.phoneInvalid.tr();
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return null;
    }

    final validEmail = const EmailSubmitRegexValidator().isValid(email);
    if (!validEmail) {
      return AppStrings.emailInvalid.tr();
    }

    return null;
  }
}
