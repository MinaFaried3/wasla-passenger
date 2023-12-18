class EndPointsManager {
  static const String baseUrl = "https://10.0.2.2:7095/api";

  //dirs
  static const String _authentication = "/auth";
  static const String _passengerAuth = "$_authentication/passenger";

  //endpoint
  //auth
  // passenger dir
  static const String register = "$_passengerAuth/register";

  // auth dir
  static const String login = "$_authentication/login";
  static const String checkUsername = "$_authentication/checkUserName";
}

class HeadersManager {
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
  static const String acceptLanguage = "Accept-Language";
  static const String authorization = "Authorization";

  static const String ar = "ar-EG";
  static const String en = "en-US";

  static const Map<String, String> jsonTypeHeader = {
    contentType: applicationJson,
  };

  static Map<String, String> baseHeaders(String lang, String token) => {
        accept: applicationJson,
        authorization: token,
        acceptLanguage: lang,
      };
}
