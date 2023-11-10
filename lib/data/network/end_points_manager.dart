class EndPointsManager {
  static const String baseUrl = "https://wasla.wiremockapi.cloud";

  //dirs
  static const String _authentication = "/Authentication";

  //endpoint
  static const String login = "$_authentication/Login";
}

class HeadersManager {
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String acceptLanguage = "Accept-Language";
  static const String ar = "ar-EG";
  static const String en = "en-US";

  static const Map<String, dynamic> loginHeaders = {
    contentType: applicationJson,
    acceptLanguage: ar
  };
}
