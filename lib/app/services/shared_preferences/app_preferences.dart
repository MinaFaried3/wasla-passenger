import 'package:wasla/app/shared/common/common_libs.dart';

class AppPreferences extends Equatable {
  final SharedPreferences _sharedPreferences;

  const AppPreferences({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<String> getAppLanguage() async {
    String? lang = _sharedPreferences.getString(PrefKeys.lang);

    //default if null or empty
    if (lang == null || lang.isEmpty) {
      return LanguageType.arabic.getLangWithCountry();
    }

    return lang;
  }

  @override
  List<Object> get props => [_sharedPreferences];
}

class PrefKeys {
  static const String lang = "LANG";
}
