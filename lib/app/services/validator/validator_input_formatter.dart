import 'package:flutter/services.dart';
import 'package:wasla/app/services/validator/string_validator.dart';

class ValidatorInputFormatter extends TextInputFormatter {
  final StringValidator editingFormatter;

  ValidatorInputFormatter({required this.editingFormatter});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final isOldValueValid = editingFormatter.isValid(oldValue.text);
    final isNewValueValid = editingFormatter.isValid(newValue.text);

    if (isOldValueValid && !isNewValueValid) {
      return oldValue;
    }

    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
