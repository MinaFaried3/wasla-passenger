class EndPointsManager {
  static const String baseUrl = "https://wasla.wiremockapi.cloud";

  //dirs
  static const String _authentication = "/Authentication";

  //endpoint
  static const String login = "$_authentication/Login";
  static const String register = "$_authentication/PassengerRegister";
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
