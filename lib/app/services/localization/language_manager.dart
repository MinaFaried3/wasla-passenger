import 'package:wasla/presentation/resources/common/common_libs.dart';

const String ar = "ar";
const String en = "en";

enum LanguageType {
  english(ar),
  arabic(en);

  final String lang;
  const LanguageType(this.lang);
}

extension GetLanguage on LanguageType {
  String getValue() {
    return this.lang;
  }
}

class LocalizationManager {
  static const Locale arabicLocal = Locale(ar, "EG");
  static const Locale englishLocal = Locale(en, "US");

  static const String assetsPath = "assets/translations";
}
