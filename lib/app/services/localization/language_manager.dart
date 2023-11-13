import 'package:wasla/app/shared/common/common_libs.dart';

const String ar = "ar";
const String en = "en";

const String egCountry = 'EG';
const String usCountry = 'US';

enum LanguageType {
  arabic(ar, egCountry),
  english(en, usCountry);

  final String lang;
  final String country;

  const LanguageType(this.lang, this.country);
}

extension GetLanguage on LanguageType {
  String getValue() {
    return lang;
  }

  String getLangWithCountry() {
    return "$lang-$country";
  }
}

class LocalizationManager {
  static const Locale arabicLocal = Locale(ar, egCountry);
  static const Locale englishLocal = Locale(en, usCountry);

  static const String assetsPath = "assets/translations";
}
