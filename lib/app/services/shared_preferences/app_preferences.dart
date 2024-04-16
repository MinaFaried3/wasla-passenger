import 'package:wasla/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';

class AppPreferences extends Equatable {
  final SharedPreferences _sharedPreferences;

  const AppPreferences({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  //General Methods
  void setData<T>({required String key, required T data}) async {
    switch (data.runtimeType) {
      case const (String):
        _sharedPreferences.setString(key, data as String);
      case const (double):
        _sharedPreferences.setDouble(key, data as double);
      case const (int):
        _sharedPreferences.setInt(key, data as int);
      case const (bool):
        _sharedPreferences.setBool(key, data as bool);
    }
  }

  bool getBool(String key) {
    bool? done = _sharedPreferences.getBool(key);

    if (done == null) {
      return false;
    }

    return true;
  }

  String getString(String key) {
    String? result = _sharedPreferences.getString(key);
    return result.orEmpty();
  }

  int getInt(String key) {
    int? result = _sharedPreferences.getInt(key);
    return result.orZero();
  }

  double getDouble(String key) {
    double? result = _sharedPreferences.getDouble(key);
    return result.orZero();
  }

  // language
  Future<String> getAppLanguage() async {
    String? lang = _sharedPreferences.getString(PrefKeys.lang);

    //default if null or empty
    if (lang == null || lang.isEmpty) {
      return LanguageType.arabic.getLangWithCountry();
    }

    return lang;
  }

  // checked if user logged in or not
  Future<String> isUserLoggedIn() async {
    String? token = _sharedPreferences.getString(PrefKeys.token);

    //default if null or empty
    if (token == null || token.isEmpty) {
      return AppConstants.emptyString;
    }

    return token;
  }

  //first route when opening the app
  Future<Routes> getOpeningRoute() async {
    if (getBool(PrefKeys.isDoneStartNowScreen) == false) {
      return Routes.startNowRoute;
    }
    if (getBool(PrefKeys.isDoneOnboardingScreen) == false) {
      return Routes.onboardingRoute;
    }

    String token = _sharedPreferences.getString(PrefKeys.token) ?? '';
    if (token.isEmpty) {
      return Routes.loginRoute;
    }

    if (getBool(PrefKeys.isRegistered) == true &&
        getBool(PrefKeys.isDoneAccountVerification) == false) {
      return Routes.verificationWayRoute;
    }

    if (getBool(PrefKeys.isDoneStartScreen) == false) {
      return Routes.start;
    }

    return Routes.home;
  }

  //save auth data
  void saveTokensData({required Tokens tokens}) {
    setData<String>(key: PrefKeys.token, data: tokens.token);
    setData<String>(
        key: PrefKeys.tokenExpireDate, data: tokens.tokenExpiryDate);
    setData<String>(key: PrefKeys.refreshToken, data: tokens.refreshToken);
    setData<String>(
        key: PrefKeys.refreshTokenExpireDate, data: tokens.refTokenExpiryDate);
  }

  @override
  List<Object> get props => [_sharedPreferences];
}
